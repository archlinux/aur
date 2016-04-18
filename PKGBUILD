# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=dialog-doc
pkgver=1.3_20160209
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Samples for the dialog, a tool to display dialog boxes from shell scripts"
arch=('any')
url="http://invisible-island.net/dialog/"
license=('GPL')
depends=(sh bash dialog)
source=(
ftp://invisible-island.net/dialog/dialog-$_pkgver.tgz
ftp://invisible-island.net/dialog/dialog-$_pkgver.tgz.asc
)
sha256sums=('0314f7f2195edc58e7567a024dc1d658c2f8ea732796d8fa4b4927df49803f87'
            'SKIP')
# ftp://invisible-island.net/dialog/
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
