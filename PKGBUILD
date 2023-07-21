# Maintainer: Freya Valent <bonifacefreya@gmail.com>
pkgname=pam_cookie
pkgver=1.0
pkgrel=1
pkgdesc="PAM module for keeping one-time-passwords valid over a period of time"
arch=('x86_64')
url="https://github.com/jwhitbeck/pam_cookie"
license=('GPL')
depends=('pam' 'openssl')
source=("https://github.com/jwhitbeck/${pkgname}/archive/v${pkgver}.tar.gz"
		"fix-makefile-for-makepkg.patch")
sha256sums=('31b94818178d46cc8b6de29b1a48f9b87e4395e44e20eb0a04403d8b4d431301'
            '67b607acc90bb9ddfff367830310fe48adf7baad0fb3c9515ea1ad576a26aa41')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < ../fix-makefile-for-makepkg.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
