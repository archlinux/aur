# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-bin
pkgver=0.2.0
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

sha256sums_x86_64=('c1701fb751e0cef86792e67e872f4317a05b57eb638afeb874e75f21a6da5e3f')
sha256sums_aarch64=('e49a2c570f8c670ff4b6359ca160e4443cf0467a2a0a561d33eae875c5d7c174')
sha256sums_armv6h=('54588b5d2c41a7b77129704385a7ae118ba78927e20b27ab100f4c86428c7f20')
sha256sums_armv7h=('1f1f5f2d26d835ea5ac354762d75be2a657b9083a907d07f498bd9231ab7cf33')

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
