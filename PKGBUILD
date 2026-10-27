# Maintainer: agony <27015 at riseup dot net>

pkgname=greenmask-bin
pkgver=0.2.26
pkgrel=1
pkgdesc='PostgreSQL dump, anonymization and restore tool (upstream build)'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64' 'powerpc64le')
url='https://github.com/GreenmaskIO/greenmask'
license=('Apache-2.0')
depends=('postgresql-libs')
provides=("greenmask=${pkgver}")
conflicts=('greenmask')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("greenmask-${pkgver}-amd64.tar.gz::${_release}/greenmask-linux-amd64.tar.gz")
source_aarch64=("greenmask-${pkgver}-arm64.tar.gz::${_release}/greenmask-linux-arm64.tar.gz")
source_armv7h=("greenmask-${pkgver}-armv7.tar.gz::${_release}/greenmask-linux-armv7.tar.gz")
source_armv6h=("greenmask-${pkgver}-armv6.tar.gz::${_release}/greenmask-linux-armv6.tar.gz")
source_riscv64=("greenmask-${pkgver}-riscv64.tar.gz::${_release}/greenmask-linux-riscv64.tar.gz")
source_powerpc64le=("greenmask-${pkgver}-ppc64le.tar.gz::${_release}/greenmask-linux-ppc64le.tar.gz")
sha256sums_x86_64=('1ed5a679f792c688b4df5bb89ecfb7dae1270bc3a438f1e605561fd30d1c0eb2')
sha256sums_aarch64=('72e2503e4b1254745c5aa8dda2be72056a0e5466b7ae5b94446df934bbdbea4a')
sha256sums_armv7h=('0c99bdad6304558be488fe4d5a90a710db9b519376f58b09d72ede87188614a1')
sha256sums_armv6h=('8e690bca9efe3504b60288b3d71b992e313170d19cd64bd693aaf8dd5922e807')
sha256sums_riscv64=('496263c78c1046666101b0ecb16f4631c6a76a12dc3a005f647dc766ec30c493')
sha256sums_powerpc64le=('4f2e0aae7ce32e5de06f122037ef93afbd2e74e35abc8d726a4297828393941b')

build() {
  for shell in bash fish zsh; do
    ./greenmask completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 greenmask -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/greenmask"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/greenmask.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_greenmask"
}
