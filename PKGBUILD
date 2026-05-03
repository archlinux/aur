# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jaume Delclòs Coll <aur@cosarara.me>
pkgname=acme-client
pkgver=1.3.7
pkgrel=1
pkgdesc="Portable version of OpenBSD's ACME client"
arch=(x86_64 aarch64)
url="https://wolfsden.cz/project/acme-client.html"
license=('GPL-2.0-only')
depends=(openssl glibc)
makedepends=(gcc make)
source=("https://files.wolfsden.cz/releases/acme-client/acme-client-$pkgver.tar.gz")
sha256sums=('32afba7a92dc8049e54342403d80b1190bbb10cd154b4637d8f62ebc4ba58801')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
    --sysconfdir=/etc \
		--mandir=/usr/share/man \
		--localstatedir=/var
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
