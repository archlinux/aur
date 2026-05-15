# Maintainer: Gustav Åkerström 23389010+gustavakerstrom@users.noreply.github.com

pkgname=hf-mount-bin
pkgver=0.6.0
pkgrel=4
pkgdesc='Mount Hugging Face Buckets and repos as local filesystems. No download, no copy, no waiting. Pre-compiled.'
arch=('x86_64' 'aarch64')
url='https://github.com/huggingface/hf-mount'
license=('Apache-2.0')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")
optdepends=('fuse3')
source=("${pkgname/-bin/}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

source_x86_64=(
  "${pkgname/-bin/}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-linux"
  "${pkgname/-bin/}-nfs-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-nfs-x86_64-linux"
  "${pkgname/-bin/}-fuse-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-fuse-x86_64-linux"
)

sha256sums_x86_64=(
  '2237097e861875aa2bd6e466844c6f03e26ccbb78867addb869af1b5fe8b0cc6'
  'd6516702ef684044359c6fc39d6270b19e1b4f0c39ff9d7f92fa20bc802ba4d0'
  'b9a2c3a2557f4005a538b8fcb753c9954aa3ab33c4fa74b24299e7ce3ad398f1'
)

source_aarch64=(
  "${pkgname/-bin/}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-linux"
  "${pkgname/-bin/}-nfs-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-nfs-aarch64-linux"
  "${pkgname/-bin/}-fuse-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-fuse-aarch64-linux"
)

sha256sums_aarch64=(
  '9e76cb7f0475809d271f876cb05448bda6702c313b31b070cae36cbe2266f45c'
  '35e793a8206b224c602f47225c1b0a2111fabf8bffe8ab535c85c0c407d63a1a'
  '6223fd10b94e4ebe0fad8b1fe621b5c607ad662f6537e00dec324c1096d840be'
)

package() {
  cd $srcdir

  install -Dm755 "${pkgname/-bin/}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm755 "${pkgname/-bin/}-nfs-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}-nfs"
  install -Dm755 "${pkgname/-bin/}-fuse-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${pkgname/-bin/}-fuse"

  cd "${pkgname/-bin/}-${pkgver}"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/"
}
