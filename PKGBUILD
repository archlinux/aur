#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Arvid Norlander <VorpalBlade@users.noreply.github.com>

pkgname=ddrescueview
pkgver=0.4.5
pkgrel=1
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('xz' 'lazarus')
source=("https://downloads.sourceforge.net/project/${pkgname}/Test%20builds/v${pkgver}/ddrescueview-source-${pkgver}.tar.xz")
sha256sums=('57383c394e62612ce2a799438b00c6e3c465c31f9ba940e077f624e2e7028465')
b2sums=('bc4ef003b0df7a7059a9f3d738e294a527a039e04e84732b285497df60a575dfedcec3deea87166dd8136cb7745b8d821e18bd499cc2b059fa463e178bdeb892')

build() {
  cd ${pkgname}-source-${pkgver}/source
#lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_pea.lpi && [ -f pea ]
#  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all ddrescueview.lpi
  lazbuild --lazarusdir=/usr/lib/lazarus ddrescueview.lpi
}

package() {
  cd ${pkgname}-source-${pkgver}

  install -D -m 755 source/${pkgname} "${pkgdir}"/usr/bin/${pkgname}

  install -dm755    "$pkgdir"/usr/share
  cp -r resources/linux/{applications,icons,man} "$pkgdir"/usr/share

  install -D -m 644 changelog.txt   "${pkgdir}"/usr/share/doc/${pkgname}/changelog.txt
  install -D -m 644 readme.txt      "${pkgdir}"/usr/share/doc/${pkgname}/readme.txt
}
# vim:set ts=2 sw=2 et:
