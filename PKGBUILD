# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=boilr
pkgver=0.4.5
pkgrel=1

pkgdesc="A CLI tool for creating and using templates for common actions"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Ilyes512/boilr"
license=('Apache')
depends=()
optdepends=()
makedepends=('go')
source=("https://github.com/Ilyes512/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('fde934c2fab5ad06b1f02abb43423ffeb780cf1002a7348d08bf6d59a84cb4d7e460efa8cbe2261662e4d55cecb6fb396b36e1060afb9eda2568f2f1ad20d543')


build() {
	#build boilr binary
	cd "$srcdir/$pkgname-$pkgver"
	
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-gcflags "all=-trimpath=${PWD}" \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
	# copy binary
	install -D -m 0755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
