# Maintainer: Maciej <macrionyn@proton.me>

pkgname=disktui
pkgver=1.2.0
pkgrel=1
pkgdesc='A terminal-based disk management utility built with Rust and Ratatui'
url='https://github.com/Maciejonos/disktui'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'parted' 'e2fsprogs' 'cryptsetup')
optdepends=(
  'dosfstools: FAT32 filesystem support'
  'ntfs-3g: NTFS filesystem support'
  'exfatprogs: exFAT filesystem support'
  'btrfs-progs: Btrfs filesystem support'
  'xfsprogs: XFS filesystem support'
  'smartmontools: SMART disk health monitoring'
)
conflicts=('disktui')
provides=('disktui')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('abd6617b2b5153f41615a0eabeca934bf9ff39a81855f74b513bafd766fdad2e')

build() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}/target/release
  install -Dm 755 disktui -t "${pkgdir}/usr/bin"

  cd ../../
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
