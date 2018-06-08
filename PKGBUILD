# Maintainer: robertfoster

pkgname=friture-git
pkgver=v0.35.r0.g98a8aac
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python-opengl' 'python-psutil' 'python-pyaudio' 'python-pyqt5' 'python-pyrr' 'python-scipy' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'git')
source=("friture::git+https://github.com/tlecomte/friture.git"
patch
friture.desktop)
md5sums=('866407aefd359ae16015f4ce6a2cd212')

build() {
	cd friture
	patch -Np1 -i ../patch
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
         '9ddb9961a2694403bb56ccfd0ae99bd2'
         '90243c7bedd2dfca1429498561ce796b')
