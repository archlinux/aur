# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-bin
pkgver=0.2.1
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

sha256sums_x86_64=('a21da3b154dcc15a0e9be515561383f7fbc3fb55d32e2e018e51b6db6935622e')
sha256sums_aarch64=('3e2b29977b91ec0240105cdd1e1749f538547bcf30f96c06d2fac971be7a368a')
sha256sums_armv6h=('8032a3485774ba96174648d218793cf6c23fe382c016969d36f26405395b4028')
sha256sums_armv7h=('ea196e46fcded69b6e2c1b708b5254dcfdda59371b8619327f3a788e1b4b1e15')

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
