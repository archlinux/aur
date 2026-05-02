# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=vim-airline-themes
pkgver=r1457.77aab8c
_gitcommit=77aab8c6cf7179ddb8a05741da7e358a86b2c3ab
pkgrel=1
pkgdesc='Themes for vim-airline'
url='https://github.com/vim-airline/vim-airline-themes'
arch=('any')
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
groups=('vim-plugins')
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

latestver() {
  local tmp
  tmp=$(mktemp -d)
  git clone --filter=blob:none --quiet "${url}.git" "${tmp}/${pkgname}"
  printf 'r%s.%s\n' \
    "$(git -C "${tmp}/${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${tmp}/${pkgname}" rev-parse --short HEAD)"
  rm -rf "${tmp}"
}

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
