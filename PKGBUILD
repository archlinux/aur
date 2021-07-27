# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Get ZeroTier playing nice with systemd-networkd and -resolved"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/zerotier/zerotier-systemd-manager"
license=("BSD-3-Clause")
depends=('zerotier-one')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname/-bin/-git}")

source_x86_64=("https://github.com/zerotier/zerotier-systemd-manager/releases/download/v${pkgver}/zerotier-systemd-manager_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zerotier/zerotier-systemd-manager/releases/download/v${pkgver}/zerotier-systemd-manager_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/zerotier/zerotier-systemd-manager/releases/download/v${pkgver}/zerotier-systemd-manager_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/zerotier/zerotier-systemd-manager/releases/download/v${pkgver}/zerotier-systemd-manager_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('69b994d95f7e2a80788b34ce3863b7073e54e72b44fcc24488d3271623996984')
sha256sums_aarch64=('5aae69d1ee0725cc4201ad4fb4f377badd7c8ace303d248b951ca9a877422a74')
sha256sums_armv6h=('1d1e6bce77e50be2805b519c2d769b5c11b0f853d5067268ff828b72fb7d85d9')
sha256sums_armv7h=('fbb35c1bdfde08bc292726dbb1c22606ffb2030094e5fb5da79a8f5e030ed9e3')

prepare() {
  cd ${srcdir}
  find . -maxdepth 1 ! -path . -type d -exec mv {} zerotier-systemd-manager \;
}

package() {
  _output="${srcdir}/zerotier-systemd-manager"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.service" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.service"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.timer" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.timer"
  install -Dm755 "${_output}/zerotier-systemd-manager" "${pkgdir}/usr/bin/zerotier-systemd-manager"
  install -Dm644 "${_output}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
