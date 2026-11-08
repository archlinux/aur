# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=yaac
pkgver=1.0beta231
pkgrel=7
pkgdesc="Yet Another APRS Client is a (mostly) platform-independent Java application for monitoring and contributing to the Automatic Packet Reporting System (APRS) network."
arch=('any')
url="https://sourceforge.net/projects/yetanotheraprsc/"
license=('LGPL-3.0-only')   # confirm -only vs -or-later against the actual LICENSE file in the zip
depends=('java-runtime>=8' 'sh')
provides=("$pkgname")
source=("${pkgname}-${pkgver}.zip::$url/files/latest/download/YAAC.zip")

package() {
    install -dm755 "$pkgdir/opt/yaac"
    find . -maxdepth 1 ! -name '.' ! -name '*.zip' -exec cp -r {} "$pkgdir/opt/yaac/" \;

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/yaac" <<'EOF'
#!/bin/sh
exec /usr/bin/java -jar "/opt/yaac/YAAC.jar" "$@"
EOF

    install -Dm644 "$pkgdir/opt/yaac/images/yaaclogo64.png" \
        "$pkgdir/usr/share/icons/hicolor/64x64/apps/yaac.png"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/yaac.desktop" <<EOF
[Desktop Entry]
Name=YAAC
Comment=Yet Another APRS Client
Exec=yaac
Icon=yaac
Terminal=false
Type=Application
Categories=HamRadio;Network;
EOF
}

sha256sums=('2bfa9571bd8ec42f97bcb2f363d0c0a601641a5d00cf80c65a28e9c6b876ea29')
