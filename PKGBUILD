# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=3.2.4
pkgrel=2
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64' 'i686')
url="https://nongnu.org/gsequencer"
license=('GPL3')
makedepends=('gtk3' 'gtk-doc' 'webkit2gtk' 'libsoup' 'fftw'  'libinstpatch' 'libpulse')
depends=('ladspa' 'dssi' 'lv2')
checkdepends=('cunit' 'xorg-server-xvfb')
provides=('gsequencer' 'midi2xml')
conflicts=('midi2xml')
source=("https://download.savannah.gnu.org/releases/gsequencer/3.2.x/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('620e7af870c02d68ab7a2d6430c147e0')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure HTMLHELP_XSL=/usr/share/xml/docbook/xsl-stylesheets-1.79.2/htmlhelp/htmlhelp.xsl --prefix=/usr --docdir=/usr/share/doc/gsequencer-doc --enable-gtk-doc --enable-gtk-doc-html --enable-single-docdir
	make
	make html
}

check() {
	cd "$pkgname-$pkgver"
	xvfb-run --server-args "-screen 0 1920x1080x24" -a make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make -j1 DESTDIR="$pkgdir/" install
	make -j1 DESTDIR="$pkgdir/" install-html
}
