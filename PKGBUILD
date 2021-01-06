# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
# Contributor: Nathan Owens <ndowens @ artixlinux.org
pkgname=libyder
_gitname=yder
pkgver=1.4.12
pkgrel=1
pkgdesc="Logging library for C applications"
arch=('x86_64')
url="https://babelouest.github.io/yder"
license=('LGPL2.1')
depends=('liborcania' 'systemd-libs')
makedepends=('git' 'cmake')
provides=('libyder.so=1.4')
source=("$_gitname-$pkgver.tar.gz::https://github.com/babelouest/yder/archive/v$pkgver.tar.gz")
sha256sums=('59bed6df43c29bf1a0f85274369f7a8bc7dfe5e94be826139e8aa05eda3ba2e6')

build() {
	cmake -B build -S "$_gitname-$pkgver" \
		-G "Unix Makefiles" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
