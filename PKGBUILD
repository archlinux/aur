# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Get ZeroTier playing nice with systemd-networkd and -resolved"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/zerotier/zerotier-systemd-manager"
license=("BSD-3-Clause")
depends=('zerotier-one')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname/-bin/-git}")

source_x86_64=("https://github.com/zerotier/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/zerotier/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/zerotier/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/zerotier/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('2eb17a5c326d1853ca1c51b50c526c6dc77ef81bafb74615aebacdc12d66b58d')
sha256sums_aarch64=('5290604c09c9175919bb4f414e1c54a97599ba9f001ea9c074208c5618ab6912')
sha256sums_armv6h=('7ab0aaf5d01abd9cc507dda8025550d5a067d16f7a3ff68358ba9c8d633ef103')
sha256sums_armv7h=('a698ce3e79790a8f106baaf45b4995fd0b27cc8aa333d90ab98d46a67e44afc2')

prepare() {
  cd ${srcdir}
  find . -maxdepth 1 ! -path . -type d -exec mv {} zerotier-systemd-manager \;
}

package() {
  _output="${srcdir}/zerotier-systemd-manager"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.service" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.service"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.timer" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.timer"
  install -Dm755 "${_output}/zerotier-systemd-manager" "${pkgdir}/usr/bin/zerotier-systemd-manager"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
