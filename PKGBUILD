# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributer: Chun Yu <junyussh@gmail.com>
pkgname=verysync-bin
_pkgname=verysync
pkgver=2.33.2
pkgrel=1
pkgdesc="微力同步 A P2P sync tool simliar to Resilio Sync that can be used in China, syncing files via secure, distributed technology. Support multi architectures."
arch=("i386" "x86_64" "arm" "aarch64" "loong64" "riscv64")
url="https://www.verysync.com/download.html"
_url="http://dl-cn.verysync.com/releases/v${pkgver}"
license=("custom")
depends=("glibc")
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
sha256sums=('6050e7d83e561a60f6e353e3cc85d90e0783cf9fbea543f21e4e85ca25bb3b3a')
sha256sums_i386=('26a5230a414ffc82a3b63d82e2d3ca615784048a4cc8d06e1f8c17ea8beab26a')
sha256sums_x86_64=('8a4b347669cd33def98b3bf1888576c8dc786ed77485080901bba0101c4413bd')
sha256sums_arm=('005ace647231cc8714b8d944dc8bc4376f4d86dd1198eae61e25ef99112a31a6')
sha256sums_aarch64=('708702fa19c321acb7e1aaa895a6f2cf8cb6189ab8ede6edf5049b61ad1f0ae0')
sha256sums_loong64=('f7962ecc018e95aef29d36fd5066b757ce0e718895ef74fa625c80b598af5bd5')
sha256sums_riscv64=('00700d8428856fd64f46cf4623a76ad39c31d3e391a7c948a12fd12c3ff1439d')

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

