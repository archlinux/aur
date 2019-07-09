# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate
pkgver=1.4.0
pkgrel=2
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs>=1.52.0'  'webkit2gtk')
makedepends=('meson>=0.40' 'ninja' 'gettext')
optdepends=('hyphen: Auto-hyphenation support'
			'hyphen-en: Hyphenation rules for English; you may choose package for your language'
			'dictd: Offline dictionary support')
source=(https://github.com/johnfactotum/${pkgname}/archive/${pkgver}.tar.gz)
provides=("$pkgname")
conflicts=("$pkgname-git")
sha256sums=('481d051299dcc26918f453e635730313ad00fac33cc8d61594e4289fff1159fd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
