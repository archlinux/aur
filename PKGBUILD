# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: David Wu <xdavidwuph@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=vim-ale-git
_pkgname=vim-ale
pkgver=3.3.0.r127.g9a23ec1f
pkgrel=1
pkgdesc='Asynchronous Lint Engine (git version)'
url='https://github.com/dense-analysis/ale'
arch=('any')
license=('BSD')
depends=('vim-plugin-runtime')
optdepends=('shellcheck: for sh/bash support'
            'flake8: for python support')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+$url.git")
sha512sums=('SKIP')
validpgpkeys=('E5132116F56ACE32A3D5D7DD0FC1ECAA8C81CD83') # _w0rp_ (Always be true to yourself) <devw0rp@gmail.com>

pkgver() {
  cd ${_pkgname}
  git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${_pkgname}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -dm 755 "${pkgdir}/usr/share/vim/vimfiles"
  cp -dr --no-preserve=ownership {ale_linters,autoload,doc,ftplugin,plugin,syntax} \
    "${pkgdir}/usr/share/vim/vimfiles"
}

# vim: ts=2 sw=2 et:
