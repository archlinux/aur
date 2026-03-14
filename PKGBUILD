_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
archivedate="02-10-26"
pkgver=2.5.16
pkgrel=1
pkgdesc="aquantia multigigabit nic driver"
# url="https://github.com/Aquantia/AQtion"
url="https://www.marvell.com"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('LINUX-HEADERS' 'tar')
conflicts=("${_pkgbase}")
# commit="340d608726cbfa04b6046d74a362e788e1e17d45"
# source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent wget -o %o %u')
source=("https://www.marvell.com/content/dam/marvell/en/drivers/Marvell_Linux_${pkgver}_${archivedate}.zip")
sha512sums=('a6ca37cb3c52e00e07667fca373491e31a5c8676eab157cce86fa24561340c707f527334410bcf2dd6b2b4c1d5ae01212e50c8dd0c193eda3450b3d4f8c1f580')

build() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/Marvell_Linux_${pkgver}_${archivedate}"
  tar -xf "atlantic.tar.gz"
}

package() {
  # cd "${srcdir}/AQtion-${commit}"
  cd "${srcdir}/Marvell_Linux_${pkgver}_${archivedate}/Linux"
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
