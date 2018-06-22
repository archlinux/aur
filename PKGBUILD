# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='nemo-peazip'
pkgver=r22.54ced3a
pkgrel=1
pkgdesc="Peazip Actions For Nemo File Manager."
arch=('any')
url="https://github.com/LinArcX/nemo-actions"
license=('GPL-3.0')
source=("${pkgname}::git+https://github.com/LinArcX/nemo-actions")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/nemo-peazip"
  install -Dm755 ./peazip-add.svg ${pkgdir}/usr/share/icons/peazip-add.svg
  install -Dm755 ./peazip-open.svg ${pkgdir}/usr/share/icons/peazip-open.svg
  install -Dm755 ./peazip-extract.svg ${pkgdir}/usr/share/icons/peazip-extract.svg

  cd "${srcdir}/nemo-peazip/usr/share/nemo/actions/"
  install -Dm755 ./AddToArchive.nemo_action ${pkgdir}/usr/share/nemo/actions/AddToArchive.nemo_action
  install -Dm644 ./ExtractHere.nemo_action ${pkgdir}/usr/share/nemo/actions/ExtractHere.nemo_action
  install -Dm644 ./OpenWIthPeazip.nemo_action ${pkgdir}/usr/share/nemo/actions/OpenWIthPeazip.nemo_action
}
