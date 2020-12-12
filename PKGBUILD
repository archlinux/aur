# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=ddrescueview
_pkgver=0.4
_pkgver_alpha=4
pkgver=${_pkgver}_alpha_${_pkgver_alpha}
pkgrel=3
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('xz' 'lazarus')
source=(  https://downloads.sourceforge.net/project/${pkgname}/Test\ builds/v${_pkgver}\ alpha\ ${_pkgver_alpha}/${pkgname}-source-${_pkgver}~alpha${_pkgver_alpha}.tar.xz)
sha256sums=('8cf914da04f2004499f9af9429b38045c7148c6aff44be96fd3853c0a84d256c')
b2sums=('81d8101b81d9fc8a3636a749356655e84ef868bf1c519392cf59851c3d6ea243905bd08f3cdc76f1db7195222f46efbd56702af0d162f8cafceb143c139d0515')

build() {
  cd ${pkgname}-source-${_pkgver}~alpha${_pkgver_alpha}/source
#lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_pea.lpi && [ -f pea ]
#  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all ddrescueview.lpi
  lazbuild --lazarusdir=/usr/lib/lazarus ddrescueview.lpi
}

package() {
  cd ${pkgname}-source-${_pkgver}~alpha${_pkgver_alpha}

  install -D -m 755 source/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -dm755    $pkgdir/usr/share
  cp -r resources/linux/{applications,icons,man} $pkgdir/usr/share

  install -D -m 644 changelog.txt   ${pkgdir}/usr/share/doc/${pkgname}/changelog.txt
  install -D -m 644 readme.txt      ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
}
# vim:set ts=2 sw=2 et:
