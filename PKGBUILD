# Maintainer: effeffe <filippo dot falezza at outlook dot it>

pkgname=specfitter-git
_pkgname=SpecFitter
pkgver=r312.b7f5efe
pkgrel=1
arch=('any')
pkgdesc='A program for gamma-ray spectroscopy or similar data analysis'
url='https://e-j-w.github.io/specfitter.html'
license=('GPL3')
depends=('gtk3')
source=(
  "git+https://github.com/e-j-w/SpecFitter.git"
  "specFitter.install"
)
sha256sums=(
  'SKIP'
  '7cb2699788cdc2bccb9d4cd5a7dc5addd5e6da6eab16e82d23f755b712b2c900'
)
install="specFitter.install"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m755 specfitter ${pkgdir}/usr/bin/specfitter
  install -D -m644 data/io.github.e_j_w.SpecFitter.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/specfitter-application-icon.svg
  install -D -m755 data/io.github.e_j_w.SpecFitter.desktop ${pkgdir}/usr/share/applications/specfitter.desktop
  install -D -m644 data/io.github.e_j_w.SpecFitter-mime.xml ${pkgdir}/usr/share/mime/packages/specfitter-mime.xml
}
