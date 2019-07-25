# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate
pkgver=1.5.3
pkgrel=1
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs>=1.52.0'  'webkit2gtk')
makedepends=('meson>=0.40' 'ninja' 'gettext')
optdepends=('hyphen: Auto-hyphenation support'
            'hyphen-en: Hyphenation rules for English; you may choose package for your language'
            'dictd: Offline dictionary support'
            'festival: Text-to-speech support; also voice package needed'
            'espeak-ng: Text-to-speech support; also voice package needed')
source=(https://github.com/johnfactotum/${pkgname}/archive/${pkgver}.tar.gz)
provides=("$pkgname")
conflicts=("$pkgname"-git)
sha256sums=('95f45c0511493a3c732f9a199ddc2b5851a220d74d93e6d14976f29f243ee2d7')
	
build() {
	cd "$srcdir"/"$pkgname-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$srcdir"/"$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	cd "$pkgdir"/usr/bin
	ln -sv com.github.johnfactotum.Foliate foliate
}
