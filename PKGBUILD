#SPDX-FileCopyrightText: Arch Linux contributors
#SPDX-License-Identifier: 0BSD
# Maintainer: Charlotte Wilson <tqpcharlie@proton.me>
pkgname=gtfs-validator-gui
pkgver=7.1.0
pkgrel=1
pkgdesc='Canonical GTFS Validator project for schedule (static) files. (GUI)'
arch=('any')
url='https://github.com/MobilityData/gtfs-validator'
license=('Apache-2.0')
depends=('jdk17-temurin')
source=("https://github.com/MobilityData/gtfs-validator/releases/download/v7.1.0/gtfs-validator-7.1.0-gui.jar")
sha256sums=('2f8a250055974a1da590ab1c48e72ac4e38481d24dee64882c40da0b2bfe4f7c')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -dm 755 "$pkgdir/usr/share/$pkgname"

    install -Dm 644 "gtfs-validator-7.1.0-gui.jar" "$pkgdir/usr/share/$pkgname/gtfs-validator-7.1.0-gui.jar"

    # Creates shell script!
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec java -jar /usr/share/\$pkgname/gtfs-validator-7.1.0-gui.jar "\$@"
EOF
    # Make the wrapper script executable
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
