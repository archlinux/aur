# Maintainer: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributpr: felix.s <felix.von.s@posteo.de>

pkgname=weborf
pkgver=0.16
pkgrel=1
pkgdesc="Minimal HTTP server to share your files"
arch=('any')
url="https://ltworf.github.io/weborf"
license=('GPL3')
depends=('openssl' 'file')
makedepends=('findutils')
optdepends=('qweborf: graphical user interface')
conflicts=('weborf-git')
source=(https://github.com/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('a0d1c181fd344268600c76d8cfd773b5f5cd9662a401bb3a8b4b038de19426d6')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	cp -r "examples" "$pkgdir/usr/share/doc/$pkgname/"

	cd "$pkgdir"
	find lib -type f -exec install -D {} usr/{} \;
	rm -r lib
}
