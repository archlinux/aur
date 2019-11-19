# Contributor: Bruno Jacquet <maxijac@free.fr>
# Contributor: CelestialWalrus <aur@celestial.cf>

pkgname=rgain
pkgver=1.3.4
_dirname='fk-'$pkgname'-8df1a846a12c'
pkgrel=2
pkgdesc="Modules to read, write and calculate Replay Gain"
arch=('any')
url="https://bitbucket.org/fk/rgain"
license=('GPL')
#Actually we get a traceback when gst-plugins-good is not installed
depends=('python2-mutagen' 'pygobject2-devel' 'gst-plugins-good' 'gst-python2')
makedepends=('python2-docutils')
optdepends=('gst-plugins-bad' 'gst-plugins-ugly')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fk/rgain/get/${pkgver}.tar.gz)
md5sums=('0b8e006e04b936146fc14d3bdc36906e')


build() {
  cd "$srcdir/$_dirname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_dirname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 build/man/collectiongain.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 build/man/replaygain.1 "${pkgdir}/usr/share/man/man1/"
}
