# Maintainer: agony <27015 at riseup dot net>

pkgname=greenmask-bin
pkgver=0.2.27
pkgrel=1
pkgdesc='PostgreSQL dump, anonymization and restore tool (prebuilt)'
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
sha256sums_x86_64=('8e80881880c263a7d89ee70209964702d9219c71e7376f8734372630feb5284d')
sha256sums_aarch64=('61daa1d3caaecbf41d660cb496f6d5872bb8fc9c087bf05170eb8adade7aec44')
sha256sums_armv7h=('32728ed222169601f8f157fa88e68c8278ccd2009f8693e3988b9ec4e3d19532')
sha256sums_armv6h=('bed013e9efb88fcb2dd5924d663a475fe16119c375d83567f22c068ce050012c')
sha256sums_riscv64=('fe304835409446eaab7a98a0317f914dd2f2e76332c4eb94685d9a400d5f1cc1')
sha256sums_powerpc64le=('df4fbd0456b900bf3a380ce7e10e699ca331b778b01b9e1f20a26f475d000405')

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
