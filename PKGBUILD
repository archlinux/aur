# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
pkgname=marvinc-git
_gitname=MarvInc
_lpkg="${_gitname,,}"
pkgver=1.0.r1.g562bc1b
pkgrel=1
pkgdesc="MarvInc is a zachlike puzzle game with a story told through emails."
arch=('x86_64')
url="https://github.com/MarvellousSoft/MarvInc/"
license=('GPL')
depends=('love')
provides=("${_lpkg}")
conflicts=("${_lpkg}")
source=('git+https://github.com/MarvellousSoft/MarvInc#branch=master')
md5sums=('SKIP')

prepare() {
	cd "$_gitname"
  git checkout master
  git pull
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v\(.*\)/\1/'
}

build() {
  cd "$_gitname"
  printf '#!/bin/bash\nlove %s' "$HOME/.marvinc/marv" > run.sh
  chmod +x run.sh
}

package() {
	cd "$_gitname"

  mkdir -p "$pkgdir$HOME/.marvinc"
  cp -r * "$pkgdir$HOME/.marvinc/"

  pushd . &> /dev/null
  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "$HOME/.marvinc/marv" marvinc
  popd &> /dev/null
}

