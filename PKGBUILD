# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=ktlint
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=0.33.0.r44.g215056a
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://github.com/pinterest/ktlint"
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
