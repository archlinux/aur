# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributer: Chun Yu <junyussh@gmail.com>
pkgname=verysync-bin
_pkgname=verysync
pkgver=2.20.1
pkgrel=5
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
sha256sums_i386=('9f6dcf10e612be1a36b6df61298949238d3ef3349897ca98ee7c6cbbf163b6b7')
sha256sums_x86_64=('33932acd8b47b72985a0a80ce218839b101e3aaaa2044108ce58950a4d8719a9')
sha256sums_arm=('187e30c44d855742dd9f70ba6214e5c0211bebf357e6cd39c6dea48d5f6422be')
sha256sums_aarch64=('a907425c747fce6bdf2b76ba5a49f19357370b666c6c833f66d8ea60d4fe3416')
sha256sums_loong64=('0589cfdc2a3e27f488a768d1f41b9a19f3ca5f6b7aeb5cb54088ee60b268be8a')
sha256sums_riscv64=('bd914682f2afa78e1eaafb6aa6575ac84e3e3b81e1668fe4e9c6b0b25b129ee4')

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

