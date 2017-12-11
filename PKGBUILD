# Maintainer: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=pyfa
pkgver=1.34.0
pkgrel=1
everelname=".arms.race"
everelver=1.3
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL')
makedepends=('unzip')
depends=('python2' 'wxpython' 'python2-sqlalchemy' 'python2-dateutil' 'python2-requests' 'python2-urllib3' 'python2-logbook')
optdepends=('python2-matplotlib: for graph plotting'
        'python2-numpy: for graph plotting')
source=(https://github.com/pyfa-org/Pyfa/releases/download/v$pkgver/pyfa-$pkgver-$everelname-$everelver-linux.zip pyfa.desktop pyfa-start.sh)

package() {
  cd "${srcdir}"/pyfa || return 1

  install -d "${pkgdir}"/usr/bin || return 1
  install -d "${pkgdir}"/usr/share/{applications,pixmaps,pyfa} || return 1

  cp -R "${srcdir}"/pyfa/* "${pkgdir}"/usr/share/pyfa || return 1
  
  unzip -p "${srcdir}"/pyfa/imgs.zip gui/pyfa64.png > "${pkgdir}"/usr/share/pixmaps/pyfa.png || return 1
  install -m 644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop || return 1
  install "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa || return 1
}

md5sums=('f028d288946118e9c52dbc6a9a64407b'
         '6f3f250ac165fecc0f9d629e4a550a72'
         '9937192cfce7f5e16e9cf26086f1899c')
