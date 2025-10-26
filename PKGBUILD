# Maintainer: Maciej <macrionyn@proton.me>

pkgname=disktui
pkgver=1.1.2
pkgrel=1
pkgdesc='A terminal-based disk management utility built with Rust and Ratatui'
url='https://github.com/Maciejonos/disktui'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'parted' 'e2fsprogs')
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
sha256sums=('26c71fbcee51250adedef7e36216254e84f974074140c012faba230c0d65817a')

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
