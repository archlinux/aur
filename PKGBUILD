# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=eclair
pkgver=0.2alpha8
_commit=8edb2a478c4313bb5d593ca6a08083e8c351d2a7
pkgrel=1
pkgdesc='A scala implementation of the Lightning Network'
arch=('any')
url='https://github.com/ACINQ/eclair'
license=('Apache')
depends=('java-environment=8' 'java-openjfx')
makedepends=('maven')
source=("git+https://github.com/ACINQ/eclair.git#commit=${_commit}"
        'eclair.sh')
sha256sums=('SKIP'
            'f70c72dfdcf25f09f1c72413b9302f81422db58bb8ed0c6c904ac2fb5432b414')

build() {
    cd ${pkgname}

    mvn package -Dmaven.test.skip=true
}

check() {
    cd ${pkgname}

    mvn test
}

package() {
    cd ${pkgname}

    install -Dm644 eclair-node-gui/target/eclair-node-gui-*.jar \
            "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/eclair.sh" "${pkgdir}/usr/bin/eclair"
}
