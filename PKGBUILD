# Maintainer: va2bbw <antelaurijssen@gmail.com>
# Last modified 2026-08-22

pkgname=yaac
pkgver=1.0beta229
pkgrel=6
pkgdesc="Yet Another APRS Client is a (mostly) platform-independent Java application for monitoring and contributing to the Automatic Packet Reporting System (APRS) network."
arch=('any')
url="https://sourceforge.net/projects/yetanotheraprsc/"
license=('LGPL-3.0-only')   # confirm -only vs -or-later against the actual LICENSE file in the zip
depends=('java-runtime>=8' 'sh')
provides=("$pkgname")
source=("${pkgname}-${pkgver}.zip::$url/files/latest/download/YAAC.zip")
sha256sums=('e64c3fca5fa466f08af49c2104ca604c14d6c1c9d681771408dd07c7db5007e6')

package() {
    install -dm755 "$pkgdir/opt/yaac"

    # Copy everything extracted from the zip, except the leftover archive
    # file itself (makepkg leaves it sitting alongside the extracted tree).
    find . -maxdepth 1 ! -name '.' ! -name '*.zip' -exec cp -r {} "$pkgdir/opt/yaac/" \;

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/yaac" <<'EOF'
#!/bin/sh
exec /usr/bin/java -jar "/opt/yaac/YAAC.jar" "$@"
EOF
}
