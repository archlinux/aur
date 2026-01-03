#SPDX-FileCopyrightText: Arch Linux contributors
#SPDX-License-Identifier: 0BSD
# Maintainer: Charlotte Wilson <tqpcharlie@proton.me>
pkgname=gtfs-validator-cli
pkgver=7.1.0
pkgrel=1
pkgdesc='Canonical GTFS Validator project for schedule (static) files. (CLI)'
arch=('any')
url='https://github.com/MobilityData/gtfs-validator'
license=('Apache-2.0')
depends=('jdk17-temurin')
makedepends=()
source=("https://github.com/MobilityData/gtfs-validator/releases/download/v7.1.0/gtfs-validator-7.1.0-cli.jar")
sha256sums=('52c2785089aaf04e7ba1bb11b2db215692e2622eb0e196b823c194d156d9b58c')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -dm 755 "$pkgdir/usr/share/$pkgname"

    install -Dm 644 "gtfs-validator-7.1.0-cli.jar" "$pkgdir/usr/share/$pkgname/gtfs-validator-7.1.0-cli.jar"

    # Creates shell script!
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec java -jar /usr/share/\$pkgname/gtfs-validator-7.1.0-cli.jar "\$@"
EOF
    # Make the wrapper script executable
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
