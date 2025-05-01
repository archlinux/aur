# Maintainer Tristan Lay <tristanjetlay1<at>gmail<dot>com>

pkgname=muzic
pkgver=0.9.0
pkgrel=1
pkgdesc="Snappy MPD client written in Zig"
arch=("x86_64")
license=("MIT")
makedepends=("zig=0.13.0")
url="https://github.com/TristanJet/muzic"
source=("https://github.com/TristanJet/muzic/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("b4eaf7ad49b79675ccfe2df94b3c298fefe2fae909676a342e86dbf1a71da9cc")

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
