# Maintainer: kharec <sandro@cazzaniga.fr>
pkgname=nixd
pkgver=2.9.0
pkgrel=1
pkgdesc='Nix language server'
arch=('x86_64')
url='https://github.com/nix-community/nixd'
license=('LGPL3')
depends=('nix' 'llvm' 'boost' 'nlohmann-json')
makedepends=('meson' 'ninja' 'pkgconf' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nixd/archive/refs/tags/$pkgver.tar.gz"
        "nixd-compat.patch")
sha256sums=('d667ca3d0c0116962a08a221ede88f2ae360d9213508d2e7efde0827ca949732'
            'c82887fa1e3630cbea77b64a9c2803c3e8fe6fa0b91126b74052aedd6e02fd27')

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/nixd-compat.patch"
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir="$pkgdir"
}
