# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate
pkgver=1.2.1
pkgrel=3
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs>=1.54.0' 'webkit2gtk' 'libsoup')
makedepends=('meson' 'ninja')
optdepends=('hyphen: Auto-hyphenation support'
						'hyphen-en: Hyphenation rules for English; you may choose package for your language')
source=(https://github.com/johnfactotum/${pkgname}/archive/${pkgver}.tar.gz)
provides=("$pkgname")
conflicts=("$pkgname-git")
md5sums=('6519880a6502b665e6919bffcd72259f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
