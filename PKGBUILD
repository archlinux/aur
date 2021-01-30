# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=qlogger-git
pkgver=r55.ed8eb78
pkgrel=1
pkgdesc="Thread-safe logger for Qt applications"
arch=(x86_64)
url="https://github.com/francescmm/QLogger"
license=('LGPL')
depends=(qt5-base)
provides=(qlogger)
conflicts=(qlogger)
source=("${pkgname}::git+https://github.com/francescmm/QLogger.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    qmake
    make
}

package() {
    cd "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/lib" libQLogger.a 
    install -Dm644 -t "${pkgdir}/usr/share/licenses/qlogger" LICENSE 
    install -Dm644 -t "${pkgdir}/usr/include" QLogger*.h
}
