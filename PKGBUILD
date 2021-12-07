# Maintainer: Harold Cheng <niuchangcun@gmail.com>
pkgname=pcstat-git
pkgver=v0.0.1.r2.g728a573
pkgrel=1
pkgdesc="Page Cache stat: get page cache stats for files on Linux"
arch=('x86_64')
url="https://github.com/tobert/pcstat"
license=('Apache')
makedepends=(go git)

source=("$pkgname::git+https://github.com/tobert/pcstat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	go build -trimpath
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 pcstat "${pkgdir}/usr/bin/pcstat"
}
