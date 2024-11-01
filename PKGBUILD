# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=ontodev-robot
pkgver=1.9.7
pkgrel=1
pkgdesc="ROBOT is an OBO Tool"
url="http://robot.obolibrary.org/"
arch=("any")
license=("BSD3")
depends=("java-runtime")
source=("https://github.com/ontodev/robot/releases/download/v${pkgver}/robot.jar")
noextract=("robot.jar")
sha256sums=('91890c2e83d0f092dd08731376f154b36610544cfbe8685337a1bf7244ccaa2d')

build() {
    cat > ${srcdir}/robot <<-EOF
	#!/bin/sh
	exec /usr/bin/java -jar '/usr/share/java/robot/robot-${pkgver}.jar' "\$@"
	EOF
}

package() {
    install -Dm644 "${srcdir}/robot.jar" "${pkgdir}/usr/share/java/robot/robot-${pkgver}.jar"
    install -Dm755 "${srcdir}/robot" "${pkgdir}/usr/bin/robot"
}
