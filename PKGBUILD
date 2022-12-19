# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=tibasicc-git
pkgver=1.2.r2.gc1a58bd
pkgrel=2
pkgdesc="TI-BASIC (de-)compiler written in C++ with a decent preprocessor - git version"
arch=("x86_64")
url="https://github.com/noahvogt/tibasicc.git"
license=('ISC')
makedepends=("git")
provides=(tibasicc)
conflicts=(tibasicc)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-*}"
	make
}

package() {
	cd tibasicc
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf doc ${pkgdir}/opt/${pkgname}
    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
