# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=mint-y-theme
pkgname=${_pkgname}-git
pkgver=105.15dab8b
pkgrel=1
pkgdesc="LinuxMint 18 Theme"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-theme.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  find "${srcdir}/${_pkgname}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}

package() {
  cp -aR --no-preserve=ownership "${srcdir}/${_pkgname}"/usr "${pkgdir}"
}
