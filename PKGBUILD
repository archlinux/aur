# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=ddrescueview
_pkgver=0.4
_pkgver_alpha=3
pkgver=${_pkgver}_alpha_${_pkgver_alpha}
pkgrel=3
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('xz' 'lazarus')
source=(  https://downloads.sourceforge.net/project/${pkgname}/Test\ builds/v${_pkgver}\ alpha\ ${_pkgver_alpha}/${pkgname}-source-${_pkgver}~alpha${_pkgver_alpha}.tar.xz
          block.inspector.resize.block.input.field.patch)
md5sums=('c936b77ca781a0b7b082cf6a5e994be8'
         '2f1fed9e38bfadf26cbc74283faa216e')

prepare() {
  cd ${srcdir}
  patch -Np0 -i block.inspector.resize.block.input.field.patch
}

build() {
  cd ${srcdir}/source
#lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_pea.lpi && [ -f pea ]
#  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all ddrescueview.lpi
  lazbuild --lazarusdir=/usr/lib/lazarus ddrescueview.lpi
}

package() {
  cd ${srcdir}
  
  install -D -m 755 source/${pkgname}                   ${pkgdir}/usr/bin/${pkgname}
  install -D -m 755 resources/linux/${pkgname}.desktop  ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m 644 resources/linux/${pkgname}.1        ${pkgdir}/usr/share/man/man1/${pkgname}.1
  install -D -m 644 resources/linux/${pkgname}.xpm      ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm 
  install -D -m 644 changelog.txt   ${pkgdir}/usr/share/doc/${pkgname}/changelog.txt
  install -D -m 644 readme.txt      ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
  
}
# vim:set ts=2 sw=2 et:
