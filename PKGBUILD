# Maintainer: Dylan <dylan@psilly.com>

pkgname=scallion
pkgver=2.1
pkgrel=1
pkgdesc="Creates vanity GPG keys and .onion addresses using OpenCL."
arch=("i686" "x86_64")
url="https://github.com/lachesis/scallion"
license=('MIT')
makedepends=('mono')
depends=('mono' 'openssl-1.0')
optdepends=(
  "opencl-nvidia: For NVIDIA"
  "opencl-mesa: For AMD/ATI Radeon mesa"
)
source=(
    "${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz"
    "scallion.sh"
    "set_openssl_1.0_paths.patch"
)
sha256sums=(
    "0b1a8daec7873546d89b1174af2e475963af86de3016ed63b28302bf5bb80c1c"
    "1090325b7cd46c5b90ac0c9c841ca6ccf15141fd3c7b2f409ebecf0db1d39dff"
    "28a1a2429bef1e150316176a07c5dfc7f5c2052e152c94ed22dd563b86408546"
)

build() {
  pushd "$srcdir/$pkgname-$pkgver"
  xbuild scallion.sln
  popd
  patch "$srcdir/$pkgname-$pkgver/$pkgname/bin/Debug/openssl.dll.config" "set_openssl_1.0_paths.patch"
}

package() {
  install -Dm755 scallion.sh "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/$pkgname-$pkgver/$pkgname/bin/Debug" "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
