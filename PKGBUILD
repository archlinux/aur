# Maintainer: robertfoster
# Contributor: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.41
pkgrel=2
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy' 'python-opengl' 'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'python-wheel')
source=("https://github.com/tlecomte/$pkgname/archive/v$pkgver.tar.gz"
	numpy.patch)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i ../numpy.patch
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
	install -Dm644 resources/images/friture.iconset/icon_512x512.png $pkgdir/usr/share/pixmaps/${pkgname}.png
	install -Dm644 appimage/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	sed -i "s|usr|/usr|g" "$pkgdir"/usr/share/applications/$pkgname.desktop
}

sha256sums=('f778798392ff29284c2cdbc3563ec83552b8a8a464a5ad35e5678448cc335a7c'
            '311df0ab345e57b0baee49a94165cbb37fc9ade4d74c7b81b4a3b542ee4bfdc1')
