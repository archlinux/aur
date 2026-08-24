# Maintainer:

_pkgname="tracy-chroma"
pkgname="$_pkgname-bin"
pkgver=0.9.1
pkgrel=1
pkgdesc="Basecalling, alignment, assembly and deconvolution of Sanger Chromatogram trace files"
url="https://github.com/gear-genomics/tracy"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

case "${CARCH::1}" in
  x)
    _bin_suffix="amd64"
    ;;
  a)
    _bin_suffix="arm64"
    ;;
esac

_bin_name="tracy-v$pkgver-linux"
_license="$_pkgname-$pkgver-LICENSE.txt"
source=("$_license"::"https://github.com/gear-genomics/tracy/raw/refs/tags/v0.8.9/LICENSE")
source_x86_64=("$url/releases/download/v${pkgver}/$_bin_name-amd64")
source_aarch64=("$url/releases/download/v${pkgver}/$_bin_name-arm64")

sha256sums=('9189a2635502bb636e2456acd15288cd56ce94f06ed28b4ffabd923194d95ecc')
sha256sums_x86_64=('df2dd5016f11aeb16d2df090e06d9fac713d4e74729b44e758165169161bc4d5')
sha256sums_aarch64=('02e091a53093a16fb3a0fdeac75a2ffa99e99a72d89a3c210301074d01c2a60d')

package() {
  install -Dm755 "$_bin_name-$_bin_suffix" "$pkgdir"/usr/bin/tracy-chroma
  install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
