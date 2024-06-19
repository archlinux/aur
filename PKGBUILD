# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=525e78f9f2b66d6b22e99806e6cc7fc5300699bb
pkgname=fsviewer
pkgver=2024.06.18
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
b2sums=('db1f350d40e51c8db7c2e048c53606cbb0153bc167102dbccfcd631a0605c21609512db706924a2af519443e04c0a9bdf08da80f8b6bea6c16359bcd89338559'
        'c4433f9607e6d13ac60785fe0d5e0bdbd31200a99ed9f213f05e463acd0370879bec55826cad2297793e80427fde0781a0444fb391e2735e20bce3e762da1ac0')

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
