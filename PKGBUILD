# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever
pkgver=0.2.10
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
license=('MIT')
provides=('remoteplaywhatever')
depends=('libtiff' 'wxwidgets-common' 'wxwidgets-gtk3')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}.git#tag=${pkgver}-alpha")
sha512sums=('ea82a5d35d88766e62792535e39e8bbc5dffc416af021e36bf42510b6e31b231e084ab04febb27e46188cc32bc62cc7c0a00f1e460c266408e04c2e39fa34f4a')

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

