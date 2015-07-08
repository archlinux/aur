# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT org>
pkgname=downpour
pkgver=0.2
pkgrel=3
pkgdesc="Web-based BitTorrent client supporting auto-downloading from RSS and importing and renaming into a media library."
arch=(any)
url="http://jongsma.org/software/downpour/"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2' 'twisted' 'sqlite3' 'python2-storm' 'python2-jinja' 'libtorrent' 'python2-feedparser' 'python2-dateutil')
options=(!emptydirs)
install=downpour.install
source=(http://jongsma.org/software/downpour/releases/Downpour-$pkgver.tar.gz
  downpour.cfg downpour.service)
sha256sums=('1ce1e65932eb378a1624001f3cc7f9ac5096c5e9581e9e4a894a1e9c36c04103'
            '92c38a126edd17c25d1da060af5e704d81aa9acbef756a6255f9568a0f89524b'
            '76714f17aa69805bd7ba3c0390c811c054c3ead6fe12bd6d7b948c45319d5734')

build() {
  cd "$srcdir/Downpour-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/Downpour-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 cfg/downpour.cfg "${pkgdir}/etc/downpour.cfg"
  install -m755 -d "${pkgdir}/var/lib/downpour/downloads"
  install -m755 -d "${pkgdir}/var/lib/downpour/tmp"
  install -Dm644 "${srcdir}"/downpour.service "${pkgdir}/usr/lib/systemd/system/downpour.service"
}
