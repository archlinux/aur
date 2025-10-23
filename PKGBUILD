# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>
pkgname=kitops
pkgver=1.9.0
pkgrel=1
pkgdesc="An open source DevOps tool from the CNCF for packaging and versioning AI/ML models, datasets, code, and configuration into an OCI Artifact."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/kitops-ml/kitops"
license=('Apache-2.0')
provides=('kit')
conflicts=('kit')
source_x86_64=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-x86_64.tar.gz")
source_i686=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-i386.tar.gz")
source_aarch64=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-arm64.tar.gz")
source=("https://raw.githubusercontent.com/kitops-ml/kitops/v${pkgver}/LICENSE")
sha256sums_x86_64=('8a1760511cae24e8a725a46efb4ba6da86e32eb438eb8ea29a8db13c5079cee2')
sha256sums_i686=('ac9053940ddde290b8c4e41d65286805ef5e709008309108533923e70dcdccc8')
sha256sums_aarch64=('40881cba0a93e187d2fc5dd5b35b7afcced6659e3679f4b51285bd36cf2c68b7')
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # Extract based on arch
  case "$CARCH" in
    x86_64)  tar -xzf kitops-linux-x86_64.tar.gz ;;
    i686)    tar -xzf kitops-linux-i386.tar.gz ;;
    aarch64) tar -xzf kitops-linux-arm64.tar.gz ;;
  esac

  # Install binary
  install -Dm755 kit "$pkgdir/usr/bin/kit"
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
