# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzic
pkgver=0.9.1
pkgrel=2
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("GPLv3")
makedepends=("zig=0.13.0")
url="https://github.com/TristanJet/muzic"
source=("https://github.com/TristanJet/muzic/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("9560bd19adf21404a84bb999864c2457e1ada943d7b2f2cb23067f47e64cfa24")

prepare() {
  zig_version=$(zig version)
  if [[ "$zig_version" != "0.13.0" ]]; then
    echo "Error: muzic requires zig version 0.13.0, but $zig_version is installed."
    echo "Please install zig 0.13.0 or update muzic for compatibility."
    exit 1
  fi
}

build() {
  cd "${pkgname}"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "${pkgname}"
  install -Dm755 zig-out/bin/out "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
