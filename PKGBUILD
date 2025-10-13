# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever
pkgver=0.2.12
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
license=('MIT')
provides=('remoteplaywhatever')
depends=('libtiff' 'wxwidgets-common' 'wxwidgets-gtk3')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}.git#tag=${pkgver}-alpha")
sha512sums=('5bc7287d228ec4f59bf309c48d5480503f714a5a71d92b327a3474da93b4343e23895ef2b998e8a81d7b9693f35be07657ab1d364b203a80b6185f67575133d7')

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

