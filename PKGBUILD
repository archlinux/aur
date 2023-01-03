# Maintainer: Miroslav Jarý <mira.jary@gmail.com>

pkgname=yin-yang
pkgver=3.2.3
pkgrel=1
pkgdesc="Light/dark theme switcher for Linux. Supports popular Desktops, text editors and more!"
arch=('any')
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
depends=('hicolor-icon-theme' 'python-numpy' 'python-psutil' 'pyside6' 'python-pyqt6' 'qt6-positioning' 'python-suntime' 'python-systemd')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.zip::https://github.com/oskarsh/Yin-Yang/archive/refs/tags/v$pkgver.zip")
sha256sums=('d0ef9cbec44df28ff0771230ae80f8eb4b0a1455be41b2e64b110bca7294dafa')

package() {
    # This is a modified version of scripts/install.sh
    cd "$(/bin/ls -d1 */ | head -n 1)"

    # Check if needed directories exists
    DIRS=(
        "$pkgdir/opt/yin-yang/"
        "$pkgdir/usr/bin/"
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
        "$pkgdir/usr/share/applications/"
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
        "$pkgdir/usr/share/licenses/yin-yang"
    )
    for dir in "${DIRS[@]}"
    do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
        fi
    done

    # Pre-cleanup not needed files
    rm -r .??* README*.md scripts/ tests/ requirements.txt

    # copy files
    cp -r ./* "$pkgdir/opt/yin-yang/"
    # move license to correct folder
    mv "$pkgdir/opt/yin-yang/LICENSE" "$pkgdir/usr/share/licenses/yin-yang/MIT"

    # copy manifest for firefox extension
    cp ./resources/yin_yang.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
    # copy terminal executive
    cp ./resources/yin-yang "$pkgdir/usr/bin/"
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
echo "Yin-Yang brings Auto Night mode for Linux"
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
echo "Check out https://github.com/oskarsh/Yin-Yang for help"
}
