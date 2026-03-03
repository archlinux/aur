# Maintainer: aksr <aksr at t-com dot me>
pkgname=teqn-git
pkgver=r75.a14a98d
pkgrel=1
pkgdesc='TeX equations to Neateqn converter preprocessor'
arch=('i686' 'x86_64')
url='https://github.com/mahdiElliot/teqn'
license=('unknown')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	c++ -o teqn --std=c++11 project.cpp
}

package() {
	cd "$srcdir/${pkgname}"
	install -D -m755 teqn $pkgdir/usr/bin/teqn
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
