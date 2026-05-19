# Maintainer: Gustav Åkerström 23389010+gustavakerstrom@users.noreply.github.com

pkgname=hf-mount-bin
pkgver=0.6.1
pkgrel=1
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
  '3c6b65a389aa4067c69be520ebb7af6cfa515571aeeb9adb3ea2a0edb239ebd3'
  '18e12d1ee20981c5dae2855aac619613b7ee654ef9d078bcfcacd95b003a485b'
  'e3e89a884e7d9947bcac89bca64dd7725f7b90e19a09e48dff9b756f5ec3dbb5'
)

source_aarch64=(
  "${pkgname/-bin/}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-linux"
  "${pkgname/-bin/}-nfs-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-nfs-aarch64-linux"
  "${pkgname/-bin/}-fuse-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-fuse-aarch64-linux"
)

sha256sums_aarch64=(
  'cac09eb3836b8bb85ac0d47c5d10fd7345d1b2cba4c4b15078efd2ee3d072ffe'
  '69008da75423a06ce55cfbee3758d0d9ddb077a586b7eba62b81490003827f8d'
  '792951c362eaed014d6a4b49b54f4b889f4fccf5012161e39a813b5d342faeab'
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
