# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
_pkgver=1.6.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=('python' 'python-twisted' 'pyside2' 'qt5-declarative')
source=("https://github.com/Syncplay/syncplay/archive/v${_pkgver}.tar.gz"
        'syncplay@.service')
sha256sums=('c573ebbc0f1a90ff5e7e19cd4f9a7470f90b1ec1686274cac563a14b9259a7a7'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-${_pkgver}"

  make DESTDIR="$pkgdir" install
}
