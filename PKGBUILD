# Maintainer: Kirill Klenov <horneds@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>

pkgname=vim-python-mode-git
pkgver=0.14.0.r12.g2db3b9e
pkgrel=1
pkgdesc='Python-mode is a vim plugin that allows you to use the pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other useful things.'
arch=('any')
license=('LGPL3')
url='https://github.com/python-mode/python-mode'
install='install'
depends=(
  'vim'
  'python'
  'python-pyflakes'
  'python-pylint'
  'python-rope'
  'python-pydocstyle'
  'python-astroid'
  'python-appdirs'
  'python-mccabe'
  'python-pycodestyle'
)
makedepends=('git')
provides=('vim-python-mode')
conflicts=('vim-python-mode')
source=("${pkgname}::git+https://github.com/python-mode/python-mode#branch=develop")
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
  rm CHANGELOG.md Dockerfile Dockerfile.base README-Docker.md docker-compose.yml readme.md
  install -d ${pkgdir}/usr/share/vim/vimfiles/
  cp -R * ${pkgdir}/usr/share/vim/vimfiles/

}

# vim:set ts=2 sw=2 et:

