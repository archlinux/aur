# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc
_pkgver=1.0.1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A CLI tool to manage your devcontainers"
arch=('x86_64')
url="https://github.com/nikaro/devc"
license=('GPL3')
depends=('docker')
optdepends=('docker-compose')
makedepends=(
	'make'
	'go'
)
provides=('devc')
conflicts=('devc' 'devc-bin' 'devc-git')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/nikaro/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('39aa8e6fbc5e1c7ebe57a89c4f9a3060a2e052465b50e07784afe5f824118b60')

build() {
	make -C "$srcdir/$pkgname-$_pkgver"
}

package() {
	make -C "$srcdir/$pkgname-$_pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
