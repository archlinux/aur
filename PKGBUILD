# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=foliate-2
pkgver=2.6.4
pkgrel=3
conflicts=('foliate')
provides=('foliate')
pkgdesc='Version 2 of Foliate: A simple and modern GTK eBook reader'
arch=(x86_64)
url="https://johnfactotum.github.io/foliate/"
license=(GPL3)
depends=(gjs
         iso-codes
         webkit2gtk)
makedepends=(gettext
             meson
             ninja)
optdepends=('dictd: Offline dictionary support'
            'espeak-ng: Text-to-speech support; also voice package needed'
            'festival: Text-to-speech support; also voice package needed'
            'gspell: Spell-checking support'
            'hyphen: Auto-hyphenation support'
            'tracker3')
_archive="foliate-$pkgver"
source=("https://github.com/johnfactotum/foliate/archive/$pkgver/$_archive.tar.gz")
sha256sums=("4a4381bff6e398f6734e1695da23f1c593ba2a67e463e07021a089ffd0741776")

build() {
	cd "$_archive"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" ninja -C build install
	ln -sv com.github.johnfactotum.Foliate "$pkgdir/usr/bin/foliate"
}
