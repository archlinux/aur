# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever
pkgver=0.2.6
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
license=('MIT')
provides=('remoteplaywhatever')
depends=('libtiff' 'wxwidgets-common' 'wxwidgets-gtk3')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}.git#tag=${pkgver}-alpha")
sha512sums=('7bc6a5b4bcdcdc35f499ee96f8aaf6c1903d3e0f945a0b81d4a5e79bd60c9874fa607f176ba7647de54450eb52682a4bd246f70c6b0c99d98c88eedb5a8f6112')

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

