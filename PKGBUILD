# Maintainer:

_pkgname="tracy-chroma"
pkgname="$_pkgname-bin"
pkgver=0.8.9
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
sha256sums_x86_64=('293d32f755f177b857684350f17c1580aa3681fb5842cca3091b5d86cabc6e97')
sha256sums_aarch64=('c9bfda047e5ae2f1680b5e40a80aa34c4bbc20fcffb00d79d0c4f1cab107955e')

package() {
  install -Dm755 "$_bin_name-$_bin_suffix" "$pkgdir"/usr/bin/tracy-chroma
  install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
