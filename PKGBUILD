# Maintainer: Jonathon Fernyhough <jonathon_at manjaro_org>

pkgname=lily
pkgver=1.5
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url=http://lily-lang.org/
license=(MIT)
depends=(glibc)
makedepends=('cmake>=3.0.0')
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/FascinatedBox/lily/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('6c364615b549ab168ff2894a5abacde11bbbaa5114fc7656c00a7d7cbc295a6f')

build() {
	cd $pkgname-v$pkgver
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

check() {
	cd $pkgname-v$pkgver
	./pre-commit-tests
}

package() {
	cd $pkgname-v$pkgver
	make DESTDIR="$pkgdir/" install
	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
