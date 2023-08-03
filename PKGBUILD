# Maintainer: MoetaYuko <loli at yuko dot moe>

_gitname=material-design-icons
pkgbase=material-symbols-git
pkgname=({ttf,woff2}-material-symbols-git)
pkgver=4.0.0+r83+g6745d95590b
pkgrel=1
pkgdesc="Material Design icons by Google"
url="https://github.com/google/material-design-icons"
arch=(any)
license=('Apache')
makedepends=(git)

pkgver() {
  cd "${_gitname}"
  git describe --tags | sed -r 's/^V//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}"
    git reset --hard
    git pull
  else
    git clone --filter=blob:none --sparse "${url}"
    cd "${_gitname}"
  fi
  git sparse-checkout init --cone
  git sparse-checkout set variablefont
}

package_ttf-material-symbols-git() {
  cd "${_gitname}"
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 variablefont/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
}

package_woff2-material-symbols-git() {
  cd "${_gitname}"
  install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 variablefont/*.woff2
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
}
