# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=3.0.7
pkgrel=1
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64' 'i686')
url="https://nongnu.org/gsequencer"
license=('GPL3')
depends=('docbook-xsl' 'webkit2gtk' 'libsoup' 'fftw' 'ladspa' 'dssi' 'lv2' 'libsndfile' 'libsamplerate' 'libinstpatch' 'libpulse' 'gtk3')
checkdepends=('cunit' 'xorg-server-xvfb')
provides=('gsequencer' 'midi2xml')
conflicts=('midi2xml')
source=("https://download.savannah.gnu.org/releases/gsequencer/3.0.x/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('055392bceae00d2747d1be6ad1749aec')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure HTMLHELP_XSL=/usr/share/xml/docbook/xsl-stylesheets-1.79.2/htmlhelp/htmlhelp.xsl --prefix=/usr --docdir=/usr/share/doc/gsequencer-doc
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
