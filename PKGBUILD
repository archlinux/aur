# Maintainer: Yatis <yann.magnin@epitech.eu>
_basename="blih_cli"
_branch="master"

pkgname="blih_cli-git"
pkgdesc="Blih CLI (say blikli) is the Blih (Bocal Lightweight Interface for Humans) Js CLI (Command-Line Interface) for linux env."
pkgver=r60.a92a49e
pkgrel=1

arch=('i686' 'x86_64')
source=("${pkgname}::git+https://github.com/GreenDjango/${_basename}.git#branch=${_branch}")
depends=('nodejs')
options=("!strip")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir/${pkgname}"
  
  # workaround to avoid sudo invokation by the "install.sh"
  if command -v ${_basename}
  then
      sudo sh uninstall.sh
  fi
}
build() {
  # There is nothing to build ? Nice
  cd "$srcdir/${pkgname}"
}
package() {
  cd "$srcdir/${pkgname}"
  sudo sh ./install.sh
}
