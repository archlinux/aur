# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=dialog-doc
pkgver=1.3_20200228
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Samples for the dialog, a tool to display dialog boxes from shell scripts"
arch=('any')
url="http://invisible-island.net/dialog/"
license=('GPL')
depends=(sh bash dialog)
source=(
ftp://ftp.invisible-island.net/dialog/dialog-$_pkgver.tgz
ftp://ftp.invisible-island.net/dialog/dialog-$_pkgver.tgz.asc
)
sha256sums=('9ff8c41d1eee9e15d14fde3109d4612b1fe6dbe71fe2c3e743bcfff5e25c1fd9'
            'SKIP')
# ftp://ftp.invisible-island.net/dialog/
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
