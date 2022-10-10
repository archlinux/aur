# Maintainer: Miroslav Jarý <mira.jary@gmail.com>

pkgname=yin-yang
pkgver=3.0.1
pkgrel=1
pkgdesc="Light/dark theme switcher for Linux. Supports popular Desktops, text editors and more!"
arch=('any')
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
depends=('python' 'python-pip')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://github.com/oskarsh/Yin-Yang/archive/refs/tags/v3.0.1.tar.gz")
sha256sums=('8d8da93878261b0f6f7548d9e1fed0028d063c0f1b95b2eeb84bd5bd97c9949d')

package() {
    # This is a modified version of scripts/install.sh
    cd "$srcdir/Yin-Yang-$pkgver"
    echo "Uninstalling old version, if it exists"
    ./scripts/uninstall.sh

    echo "Installing dependencies …"
    pip3 install -r requirements.txt

    echo "Installing yin yang"

    # Check if needed directories exists
    DIRS=(
        "$pkgdir/opt/yin-yang/"
        "$pkgdir/usr/bin/"
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
        "$pkgdir/usr/share/applications/"
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    )
    for dir in "${DIRS[@]}"
    do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
        fi
    done

    # copy files TODO this copies a bunch of unnecessary files
    cp -r ./* "$pkgdir/opt/yin-yang/"
    # copy manifest for firefox extension
    cp ./resources/yin_yang.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
    # copy terminal executive
    cp ./scripts/yin-yang "$pkgdir/usr/bin/"
    # copy .desktop file
    cp ./resources/Yin-Yang.desktop "$pkgdir/usr/share/applications/Yin-Yang.desktop"
    # copy icon
    cp ./resources/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/yin_yang.svg"

    cat << "EOF"
 __     ___          __     __
 \ \   / (_)         \ \   / /
  \ \_/ / _ _ __ _____\ \_/ /_ _ _ __   __ _
   \   / | | '_ \______\   / _` | '_ \ / _` |
    | |  | | | | |      | | (_| | | | | (_| |
    |_|  |_|_| |_|      |_|\__,_|_| |_|\__, |
                                        __/ |
                                       |___/
EOF
echo ""
echo "Yin-Yang brings Auto Nightmode for Linux"
echo ""
cat << "EOF"
       _..oo8"""Y8b.._
     .88888888o.    "Yb.
   .d888P""Y8888b      "b.
  o88888    88888)       "b
 d888888b..d8888P         'b
 88888888888888"           8
(88DWB8888888P             8)
 8888888888P               8
 Y88888888P     ee        .P
  Y888888(     8888      oP
   "Y88888b     ""     oP"
     "Y8888o._     _.oP"
       `""Y888boodP""'
EOF
    echo ""
    echo ""
    echo "checkout https://github.com/daehruoydeef/Yin-Yang for help"
    echo "Yin-Yang is now installed"
}
