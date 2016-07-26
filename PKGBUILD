# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map-dev-git
_gitname=PokemonGo-Map
pkgver=r579.2e6c870
pkgrel=1
pkgdesc='Live visualization of all the pokemon in your area... and more! (dev branch)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'python2' 'npm' 'python2-configargparse' 'python2-flask-compress' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("git://github.com/AHAAAAAAA/${_gitname}#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_gitname/"
  npm install
}

package() {  
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/$_gitname/" "${pkgdir}/opt/${pkgname}"

  # workaround for issue #1348
  mkdir -p "${pkgdir}/opt/${pkgname}/config"
  chmod -R 777 "${pkgdir}/opt/${pkgname}/config"
}
