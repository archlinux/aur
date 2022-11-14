# Maintainer: Miroslav Jarý <mira.jary@gmail.com>

pkgname=yin-yang
pkgver=3.2.0
pkgrel=1
pkgdesc="Light/dark theme switcher for Linux. Supports popular Desktops, text editors and more!"
arch=('any')
url="https://github.com/oskarsh/Yin-Yang"
license=('MIT')
depends=('python-psutil' 'python-suntime' 'python-systemd' 'python-pyqt6' 'pyside6' 'qt6-positioning')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.zip::https://github.com/oskarsh/Yin-Yang/archive/refs/tags/v3.2.0.zip")
sha256sums=('b1f0704c47c58b70e1fb0987e393e140c0dcf74b1dc669e5b3c1a8ce2f8b70c6')

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
        "$pkgdir/usr/lib/systemd/user/"
        "$pkgdir/usr/share/licenses/yin-yang"
    )
    for dir in "${DIRS[@]}"
    do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
        fi
    done

    # Pre-cleanup
    rm -r README*.md tests/ requirements.txt

    # copy files
    cp -r ./* "$pkgdir/opt/yin-yang/"
    # cleanup unnecessary files
    mv "$pkgdir/opt/yin-yang/LICENSE" "$pkgdir/usr/share/licenses/yin-yang/MIT"

    # copy manifest for firefox extension
    cp ./resources/yin_yang.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
    # copy terminal executive
    cp ./resources/yin-yang "$pkgdir/usr/bin/"
    # copy .desktop file
    cp ./resources/Yin-Yang.desktop "$pkgdir/usr/share/applications/Yin-Yang.desktop"
    # copy icon
    cp ./resources/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/yin_yang.svg"
    # systemd unit files
    cp ./resources/yin_yang.service "$pkgdir/usr/lib/systemd/user/yin_yang.service"
    cp ./resources/yin_yang.timer "$pkgdir/usr/lib/systemd/user/yin_yang.timer"

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
    echo "checkout https://github.com/daehruoydeef/Yin-Yang for help"
    echo "Yin-Yang is now installed"
}
