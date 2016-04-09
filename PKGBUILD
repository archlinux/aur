# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=mint-y-theme
pkgname=${_pkgname}-git
pkgver=14.ea98044
pkgrel=2
pkgdesc="New theme from LinuxMint 18"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=()
makedepends=('python')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-theme.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${srcdir}/${_pkgname}/src
  
  python ./build-themes.py
  
  cd ..  
  cp -aR ./usr ${pkgdir}

  find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;

}
