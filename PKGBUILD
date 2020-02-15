# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=urweb
pkgver=20200209
pkgrel=1
pkgdesc="Ur/Web: purely functional language/framework for web programming"
arch=('i686' 'x86_64')
url="http://www.impredicative.com/ur/"
license=('BSD')
makedepends=('curl' 'mlton')
depends=('libmariadbclient' 'postgresql-client' 'sqlite3' 'openssl' 'uthash')
source=("https://github.com/urweb/urweb/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
	"use-system-uthash.patch")
sha512sums=('a8b196cb8132d4f32069b7400ebc19569a34637daabc06139f1ad3cd808550f31ff09b670981fe7829c2b185497fcba9ffe202a30537cab179e26e84d58b40b6'
            'df7089e75d91c14568bcc01d0a0cf9d57e073c5e2c278508305176a8b7f2775f27a26b66d82e1566f00d473e89099480273a7b6f5f11d927802de959da3678ac')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/use-system-uthash.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
