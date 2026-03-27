# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever
pkgver=0.2.14
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
license=('MIT')
provides=('remoteplaywhatever')
depends=('libtiff' 'wxwidgets-common' 'wxwidgets-gtk3')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}.git#tag=${pkgver}-alpha")
sha512sums=('dc43d2ad4487a7abd22fbf296b64308c05143d36bd1f86001cb483dc92104910cc8b00df87c4bbedbefdddb175b457d72c3b45da0907fd9b7748806e378774ed')

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

