# Maintainer: Bagić Jure <jure.bagic@gmail.com>
pkgname='ashe'
pkgver=r40.2472863
pkgrel=1
pkgdesc="Modern UNIX async shell."
arch=("x86_64")
url="https://github.com/SigmaBale/ashe"
license=("GPL3")
depends=("glibc")
makedepends=("git" "cmake")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    mkdir 'build'
    cd 'build'
    cmake ..
    make
}

package() {
	cd "${pkgname}/build"
    install -Dm644 ashe "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
