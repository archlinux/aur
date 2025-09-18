# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>
pkgname=kitops
pkgver=1.8.0
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
sha256sums_x86_64=('0a55cd3012dbd637d87990e1c3924e0873cb8113e5112d24c3ad3ae2a8611240')
sha256sums_i686=('f724db1ddd82e0fdafcbee92e3049cf9612a0507c57a77644f8da4ded5492f81')
sha256sums_aarch64=('36b08156908dca24b2e16d0ef2dd9571e0439eb22f326056ddb11a861690f21d')
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
