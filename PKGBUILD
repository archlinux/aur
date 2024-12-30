_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
archivedate="07-18-24"
pkgver=2.5.12
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
source=("https://www.marvell.com/content/dam/marvell/en/drivers/${archivedate}_Marvell_Linux_${pkgver}.zip")
sha512sums=('0b5111043e112a5afe4dd3d3fb4104758ac853bdc8eeefc425584c8a0d31d2ac5d02c76bcc8d290c3b6ba59c650c8bf50148ec34109f1d25354ad0c332e61a01')

build() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/${archivedate}_Marvell_Linux_${pkgver}"
  tar -xf "atlantic.tar.gz"
}

package() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/${archivedate}_Marvell_Linux_${pkgver}/Linux"
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
