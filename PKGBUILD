# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=vim-ale-git
_pkgname=vim-ale
pkgver=2.6.0.r31.gdb6b1b5e
pkgrel=1
pkgdesc='Asynchronous Lint Engine (git version)'
url='https://github.com/w0rp/ale'
arch=('any')
license=('BSD')
depends=('vim')
optdepends=('shellcheck: for sh/bash support'
            'flake8: for python support')
makedepends=('git')
provides=('vim-ale')
conflicts=('vim-ale')
source=("${_pkgname}::git+https://github.com/w0rp/ale")
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
