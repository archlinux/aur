# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>
# Co-maintainer: Alexandria Pettit <alxpettit@gmail.com>
pkgname=syncplay
_pkgver=1.6.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=('python' 'python-twisted') 
optdepends=('pyside2' 'qt5-declarative' 'python-service_identity')
source=("https://github.com/Syncplay/syncplay/archive/v${_pkgver}.tar.gz"
        'syncplay@.service')
sha256sums=('42f2e18063dbc4e540d6be423d459f6b359977dd5c2188df41846017378ba0a0'
            '2033d40daad02f06eede073d0cee39fba8c70289dd71e8444d429b810438ec3a')
install=syncplay.install
package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service

  cd "syncplay-${_pkgver}"

  make DESTDIR="$pkgdir" install
}
