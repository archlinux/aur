# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=8431fe5d1c9ca5351776abc12c60a57cd2ba975d
pkgname=fsviewer
pkgver=2024.12.05
pkgrel=1
pkgdesc="A NeXT FileViewer lookalike for Window Maker"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/roblillack/fsviewer"
license=('GPL-2.0-or-later')
depends=('windowmaker')
makedepends=('cmake')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/roblillack/${pkgname}/archive/${_commit}.tar.gz"
        "${pkgname}-lib.patch")
b2sums=('783ee59824002e396620faf8f3cd0e276b2fb7f7cf029c10716c2df5f1d5db81703fe8501d6399c4751dd14c658d5b01d6e5cbb7bb6f070299ff7c4f5d49841a'
        'ab0dcddf2891ded0a58dcebf38cf97f7aeef95a830c0f927705981da0f850b98cf3c9e1883f2e90675503a39b406403137dfb3be0c47c3ff9321cb5c9fc05852')

prepare() {
  cd "${pkgname}-${_commit}"
  patch -Np1 -i ../${pkgname}-lib.patch
  CMAKE_INSTALL_PREFIX=/usr cmake .
}

build() {
  cd "${pkgname}-${_commit}"
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install
}
