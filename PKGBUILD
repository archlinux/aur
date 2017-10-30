# Maintainer: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>

pkgname=pyfa
pkgver=1.33.1
pkgrel=1
everelname="lifeblood"
everelver=1.0
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

md5sums=('14a74be4cbd293eef46a5a0eb77e6fb8'
         'd8eb1816f80ccd821f7cd6c96186bd8b'
         '9937192cfce7f5e16e9cf26086f1899c')
