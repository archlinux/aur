_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.2.6.0_178
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://www.aquantia.com/support/driver-download/"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
zipname="20190605_Linux_ver_2.2.6.0.178"
source=("https://s3-us-west-2.amazonaws.com/aq-media/wp-content/uploads/2019/06/${zipname}.zip")
md5sums=('fcb1dc1c20f93a4e7919139645b8280d')

build() {
  cd "${srcdir}/${zipname}/"
  tar zxf "atlantic.tar.gz"
}

package() {
  cd "${srcdir}/${zipname}/Linux"
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
