# Maintainer: kharec <sandro@cazzaniga.fr>
pkgname=nixd
pkgver=2.8.2
pkgrel=1
pkgdesc='Nix language server'
arch=('x86_64')
url='https://github.com/nix-community/nixd'
license=('LGPL3')
depends=('nix' 'llvm' 'boost' 'nlohmann-json')
makedepends=('meson' 'ninja' 'pkgconf' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nixd/archive/refs/tags/$pkgver.tar.gz"
        "nixd-compat.patch")
sha256sums=('846adb7d7cd6395bbb47d55b4862710ead2de09820224e0093688a096cb7146f'
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
