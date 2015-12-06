# Maintainer: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>


pkgname=pyfa-singularity
pkgver=986018
pkgrel=1
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="http://github.com/DarkFenX/Pyfa"
license=('GPL')
makedepends=('unzip')
depends=('python2' 'wxpython' 'python2-sqlalchemy' 'python2-dateutil' 'python2-requests' 'python2-urllib3')
optdepends=('python2-matplotlib: for graph plotting'
        'python2-numpy: for graph plotting')
source=(https://github.com/DarkFenX/Pyfa/releases/download/singularity-$pkgver/pyfa-singularity-$pkgver-linux.zip pyfa.desktop pyfa-start.sh)

package() {
  cd "${srcdir}"/pyfa || return 1

  install -d "${pkgdir}"/usr/bin || return 1
  install -d "${pkgdir}"/usr/share/{applications,pixmaps,pyfa} || return 1

  cp -R "${srcdir}"/pyfa/* "${pkgdir}"/usr/share/${pkgname} || return 1
  
  unzip -p "${srcdir}"/pyfa/imgs.zip gui/pyfa64.png > "${pkgdir}"/usr/share/pixmaps/${pkgname}.png || return 1
  install -m 644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop || return 1
  install "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/${pkgname} || return 1
}

md5sums=('21b6b12d2de9e76c14790a0b4bbf0356'
         'eb5f7ee8402082b596b262b4229bb9f4'
         '61b12c903d49964bd4327ba8debd8166')
