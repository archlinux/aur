# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=dialog-doc
pkgver=1.3_20200327
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Samples for the dialog, a tool to display dialog boxes from shell scripts"
arch=('any')
url="http://invisible-island.net/dialog/"
# ftp://ftp.invisible-island.net/dialog/
license=('GPL')
depends=(sh bash dialog)
source=(
ftp://ftp.invisible-island.net/dialog/dialog-$_pkgver.tgz
ftp://ftp.invisible-island.net/dialog/dialog-$_pkgver.tgz.asc
)
sha256sums=('466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99'
            'SKIP')

validpgpkeys=(C52048C0C0748FEE227D47A2702353E0F7E48EDB) #Thomas Dickey <dickey@invisible-island.net>
package() {
  cd "${srcdir}"/dialog-${_pkgver}/samples/

  install -dm755 ${pkgdir}/usr/share/doc/dialog/samples

  # search for executeables files
  find -maxdepth 1 -type f -executable -print | \
    xargs -I{} cp {} ${pkgdir}/usr/share/doc/dialog/samples/

  for i in README report-* setup-* testdata-8bit textbox.txt whiptail.rc \
    checklist9.txt; do
    install -Dm 644 $i ${pkgdir}/usr/share/doc/dialog/samples
  done
}
