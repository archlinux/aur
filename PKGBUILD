# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc
_pkgver=1.0.0-beta.7
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
sha256sums=('7e4d84e491a982ab6eb3b438352f86c82e4ba44aac85dd6d1ba29ba2fe03fb1a')

build() {
	make -C "$srcdir/$pkgname-$_pkgver"
}

package() {
	make -C "$srcdir/$pkgname-$_pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
