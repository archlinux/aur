# Maintainer: robertfoster

pkgname=friture-git
pkgver=v0.35.r2.g66231f3
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python-opengl' 'python-psutil' 'python-pyaudio' 'python-pyqt5' 'python-pyrr' 'python-scipy' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'git')
source=("friture::git+https://github.com/tlecomte/friture.git"
friture.desktop)

build() {
	cd friture
	python setup.py build
}

package() {
	cd friture
	python setup.py install --root="$pkgdir/"
	install -Dm775 resources/images/friture.iconset/icon_512x512.png $pkgdir/usr/share/pixmaps/friture.png
	install -Dm775 $srcdir/friture.desktop $pkgdir/usr/share/applications/friture.desktop
}

pkgver() {
	cd friture
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
'90243c7bedd2dfca1429498561ce796b')
