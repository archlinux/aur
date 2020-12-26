# Maintainer: robertfoster
# Contributor: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.42
pkgrel=1
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy' 'python-opengl' 'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer' 'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython' 'python-wheel')
_commit=99dd16498888a5fc5f14bb00c380cb5ce2f54c73
source=("https://github.com/tlecomte/$pkgname/archive/${_commit}.tar.gz")

build() {
  cd "$srcdir/$pkgname-${_commit}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${_commit}"
  python setup.py install --root="$pkgdir/"
  install -Dm644 resources/images/friture.iconset/icon_512x512.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  install -Dm644 appimage/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  sed -i "s|usr|/usr|g" "$pkgdir"/usr/share/applications/$pkgname.desktop
}

sha256sums=('1a2fc0e6a728c3444a712fc69f14248bae3ebdb526c879bbdb26a2798f1906ae')
