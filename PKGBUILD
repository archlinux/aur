# Maintainer: nycex <nycex@protonmail.com>
_pkgbasename=ktlint
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=0.33.0.r44.g215056a
pkgdesc="Generate PKGBUILD from pip packages"
arch=('any')
url="http://github.com/sollidsnake/pipman"
license=('MIT')
depends=('java-runtime')
source=(git+https://github.com/pinterest/${_pkgbasename})
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    ./mvnw -Pcapsule clean package -Dmaven.test.skip=true
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    install -D -m755 ktlint/target/ktlint "${pkgdir}/usr/bin/ktlint"
    install -D -m644 LICENSE "${pkgdir}/usr/share/license/ktlint/LICENSE"
}
