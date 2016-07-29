# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map-dev-git
_gitname=PokemonGo-Map
pkgver=1
pkgrel=1
pkgdesc='Live visualization of all the pokemon in your area... and more! (dev branch)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'nodejs-grunt-cli' 'python2' 'npm' 'python2-configargparse' 'python2-flask-compress' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("git://github.com/AHAAAAAAA/${_gitname}#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_gitname/"
  npm install
  npm run-script build
}

package() {  
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/$_gitname/" "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}/opt/${pkgname}/.git"
  rm -rf "${pkgdir}/opt/${pkgname}/node_modules"
  rm -rf "${pkgdir}/opt/${pkgname}/.github"
}
