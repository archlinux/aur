# Maintainer: Felix Potthast <felix_potthast AT web DOT de>
# Contributor: Philipp Joram <mail AT phijor DOT me>

pkgname=picasso-3ds-git
_gitname=picasso
pkgrel=1
pkgver=r59.bc051ca
epoch=1
pkgdesc="Picasso shader assembler for 3DS homebrew"
arch=('any')
url="https://github.com/fincs/picasso/"
license=('custom')
groups=()
makedepends=('gcc' 'autoconf' 'automake')

source=('picasso::git://github.com/fincs/picasso')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 "$srcdir/${_gitname}/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}
