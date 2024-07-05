# Maintainer: Khiet Tam Nguyen <tam.nguyen1@unsw.edu.au>
pkgname=dcc-git
pkgver=2.34.r381.f41dca3
pkgrel=1
pkgdesc="dcc - a C compiler which explains errors to novice programmers "
arch=(x86_64)
url="https://github.com/COMP1511UNSW/dcc"
license=('GPL')
depends=(clang curl gcc gdb python3 valgrind)
makedepends=(git make zip help2man)
provides=(dcc)
conflicts=(dcc)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd dcc
	printf "2.34.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dcc
    make
    help2man --include=lib/help2man_include.txt ./dcc > dcc.1
}

package() {
    cd dcc
    install -Dm755 ./dcc "${pkgdir}/usr/bin/dcc"
    install -Dm644 ./dcc.1 "${pkgdir}/usr/share/man/man1/dcc.1"
    install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

