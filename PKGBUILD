_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.5.6
pkgrel=1
pkgdesc="aquantia multigigabit nic driver"
# url="https://github.com/Aquantia/AQtion"
url="https://www.marvell.com"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers' 'tar')
conflicts=("${_pkgbase}")
# commit="340d608726cbfa04b6046d74a362e788e1e17d45"
# source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
source=("https://www.marvell.com/content/dam/marvell/en/drivers/marvell_linux_${pkgver}.zip")
sha512sums=('efae75a72faca5b313ac7882721ea96d12aeeba48da4ab735d60eafbbad779de7ed7c27211317658526960a9abd1f7192325ed5b0635e5a03ae0d77964b0cd55')

build() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/"*"_Marvell_Linux_${pkgver}"
  tar -xf "atlantic_${pkgver}.tar.gz"
}

package() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/"*"_Marvell_Linux_${pkgver}/Linux"
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cat <<EOF >${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	PACKAGE_NAME="${_pkgbase}"
	BUILT_MODULE_NAME[0]="${_pkgbase}"
	PACKAGE_VERSION="${pkgver}"
	DEST_MODULE_LOCATION[0]="/kernel/drivers/net/ethernet/aquantia/atlantic"
	AUTOINSTALL="yes"
EOF
}
