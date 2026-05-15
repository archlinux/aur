# Maintainer: Gustav Åkerström 23389010+gustavakerstrom@users.noreply.github.com

pkgname=hf-mount-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='Mount Hugging Face Buckets and repos as local filesystems. No download, no copy, no waiting. Pre-compiled.'
arch=('x86_64' 'aarch64')
url='https://github.com/huggingface/hf-mount'
license=('Apache-2.0')
provides=('hf-mount')
optdepends=('fuse3')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

source_x86_64=(
  "${pkgname/-bin/}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-linux"
  "${pkgname/-bin/}-nfs-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-nfs-x86_64-linux"
  "${pkgname/-bin/}-fuse-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-fuse-x86_64-linux"
)

sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')

source_aarch64=(
  "${pkgname/-bin/}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-linux"
  "${pkgname/-bin/}-nfs-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-nfs-aarch64-linux"
  "${pkgname/-bin/}-fuse-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-fuse-aarch64-linux"
)

sha256sums_aarch64=('SKIP' 'SKIP' 'SKIP')

package() {
  cd $srcdir

  install -Dm755 "${pkgname/-bin/}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm755 "${pkgname/-bin/}-nfs-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}-nfs"
  install -Dm755 "${pkgname/-bin/}-fuse-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}-fuse"

  install -Dm644 "${pkgname/-bin/}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}/"
}
