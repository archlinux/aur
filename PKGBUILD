# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.14
pkgrel=2
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="http://tlecomte.github.com/friture/"
license=('GPL3')
depends=('pyqwt' 'python2-scipy' 'python2-psutil' 'python2-pyaudio')
optdepends=('jack: for JACK I/O support')
makedepends=('cython2')
source=("http://pypi.python.org/packages/source/f/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('866407aefd359ae16015f4ce6a2cd212')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # python2, CRLF fix
  sed -i 's/\r//;s/env python/&2/' `find "$pkgdir" -name "*.py"` \
    "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
