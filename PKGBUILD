# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributer: Chun Yu <junyussh@gmail.com>
pkgname=verysync-bin
_pkgname=verysync
pkgver=2.21.3
pkgrel=1
pkgdesc="微力同步 A P2P sync tool simliar to Resilio Sync that can be used in China, syncing files via secure, distributed technology. Support multi architecture."
arch=("i386" "x86_64" "arm" "aarch64" "loong64" "riscv64")
url="https://www.verysync.com/download.html"
_url="http://dl-cn.verysync.com/releases/v${pkgver}"
license=("custom")
depends=("bind")
provides=("verysync")
conflicts=("verysync" "verysync2")
install="${pkgname}.install"
source=("verysync.service")
source_i386=("${_pkgname}_i386-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-386-v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}_amd64-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_arm=("${_pkgname}_arm-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-arm-v${pkgver}.tar.gz")
source_aarch64=("${_pkgname}_arm64-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
source_loong64=("${_pkgname}_loong64-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-loong64-v${pkgver}.tar.gz")
source_riscv64=("${_pkgname}_riscv64-${pkgver}.tar.gz::${_url}/${_pkgname}-linux-riscv64-v${pkgver}.tar.gz")
sha256sums=('569b24c69d571d49533aa6ea0fbeef0637fd74581177fbe9f71e16bb04ee4573')
sha256sums_i386=('976210bf42da9b5a39ee8d41cce3b4edc3c1d9045192617a5b4b063f8182af74')
sha256sums_x86_64=('340ef24c27e4aa4df5a52824c63f8fb407947e75174673d94c18df4a8664287b')
sha256sums_arm=('33a1831fa26910a57a5fdf82ed2ba8ccf58bab41e10b989e546cfaf69371fccc')
sha256sums_aarch64=('66bce5e9725969c4aa9ec057830f5197156526b2a2ff8ae92ae155cd4665fd8b')
sha256sums_loong64=('c70ea700ebaad77c2d98ac9580191bd1bfaae4b0a5590382e29ffb8b73ab3550')
sha256sums_riscv64=('348669525a5ef80b70ab3570d8bfc558bafdbbad6954fc2eeb3d55ab972be864')

package() {
	# get the verysync directory name
	dirname=$(ls -d */ | head -n 1)
	# rename the directory
	mv ${srcdir}/${dirname} "${srcdir}/verysync"
	# install main binary
	install -D -m 755 "${srcdir}/verysync"/verysync "${pkgdir}"/usr/bin/verysync
	# install service
	install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}

