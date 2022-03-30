# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-bin
pkgver=0.3.0
pkgrel=1
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

sha256sums_x86_64=('47cbf99ee4c9cb95f1d691a085b3b632ff778f15b39de2b9ca3aa03371c7bc12')
sha256sums_aarch64=('9cb4f11d77ac3b3e4c584defff31343c4a27fc51419e9a54241a273b0b95d455')
sha256sums_armv6h=('f166ecd2373afde583b1d5f87f83c0db270f5f4ad64345e6fa7d6262f852732c')
sha256sums_armv7h=('8c81f8696610c134f6f133d95ad84d0fdb38d41f504d0fd3e890b73e4193353f')

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
