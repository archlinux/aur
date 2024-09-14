# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever
pkgver=0.2.8
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
license=('MIT')
provides=('remoteplaywhatever')
depends=('libtiff' 'wxwidgets-common' 'wxwidgets-gtk3')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}.git#tag=${pkgver}-alpha")
sha512sums=('13efa7474307976d05fc93b6fd713b4d9789b8108d674bd03cf8c89926594dbc08ce16fda7995479768e30544f86089b447b2693991646cea3cd3f8fb6baa42a')

prepare() {
  git -C "${pkgname}" submodule update --init --recursive
}

build() {
  cmake -B build -S "${pkgname}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

