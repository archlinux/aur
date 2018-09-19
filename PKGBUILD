# Maintainer: Kirill Klenov <horneds@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>

pkgname=vim-python-mode-git
pkgver=0.9.2.r3.gf94b0d7
pkgrel=1
pkgdesc='Python-mode is a vim plugin that allows you to use the pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other useful things.'
arch=('any')
license=('LGPL3')
url='https://github.com/python-mode/python-mode'
install='install'
depends=('vim' 'python2')
makedepends=('git')
source=("${pkgname}::git+https://github.com/python-mode/python-mode#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {

  cd ${srcdir}/${pkgname}
  rm AUTHORS Changelog.rst COPYING Gemfile logo.png Makefile Rakefile README.rst
  install -d ${pkgdir}/usr/share/vim/vimfiles/
  cp -R * ${pkgdir}/usr/share/vim/vimfiles/

}

# vim:set ts=2 sw=2 et:

