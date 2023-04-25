# Maintainer: Rafael silva <perigoso@riseup.net>

themename="catppuccin"
pkgname=sddm-theme-${themename}-git
pkgver=r47.bde6932
pkgrel=1
pkgdesc="Soothing pastel theme for SDDM"
arch=('any')
url="https://github.com/catppuccin/sddm"
license=('MIT')
depends=('sddm')
makedepends=('git')
source=("${themename}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${themename}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"

  target="${pkgdir}/usr/share/sddm/themes/"

  install -d "${target}"

  basepath="${srcdir}/${themename}/src"

  for dir in "${basepath}"/*/; do
    if [ -d "${dir}" ]; then
      cp -dr --no-preserve=ownership "${dir}" "${target}/"
    fi
  done

  rm -rf "${pkgdir}/usr/share/sddm/themes/${themename}/README.md"
}
