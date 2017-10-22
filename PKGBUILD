# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay
_pkgver=1.5.0-RC1
pkgver=${_pkgver//-RC/.rc}
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=(python2 python2-pyside python2-twisted)
source=("https://github.com/Syncplay/syncplay/archive/v${_pkgver}.tar.gz"
        syncplay@.service)
sha256sums=('d3dbe6b079511063f5b7e5e86f95440ad6d80857bcb3ed9e6385dce10b8bb18a'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-${_pkgver}"

  make DESTDIR="$pkgdir" install
}
