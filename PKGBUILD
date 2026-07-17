# Maintainer: kharec <sandro@cazzaniga.fr>
pkgname=nixd
pkgver=2.9.2
pkgrel=1
pkgdesc='Nix language server'
arch=('x86_64')
url='https://github.com/nix-community/nixd'
license=('LGPL3')
depends=('nix' 'llvm' 'boost' 'nlohmann-json')
makedepends=('meson' 'ninja' 'pkgconf' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nixd/archive/refs/tags/$pkgver.tar.gz"
        "nixd-llvm19-compat.patch")
sha256sums=('2b46cc1e91fcf76e7b939905fa696217ea96639af9e9444cfe8afa18088cccbd'
            'a2fc1f82264e43873a34e4742b456383f4a32fb474c5618da598f80e6895f8f1')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/nixd-llvm19-compat.patch"
}

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir="$pkgdir"
}
