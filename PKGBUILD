_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.0.15.0
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://www.aquantia.com/support/driver-download/"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
zipname="20180706_Linux_2.0.15.0"
source=("https://s3-us-west-1.amazonaws.com/aquantia-staging/wp-content/uploads/2018/07/${zipname}.zip")
md5sums=('1167bef23129284bf4893c3922257c60')

build() {
  cd "${srcdir}/${zipname}/src"
  tar zxf "Atlantic-${pkgver}.tar.gz"
}

package() {
  cd "${srcdir}/${zipname}/src/Linux-200"
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cat <<EOF >${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	PACKAGE_NAME="${_pkgbase}"
	BUILT_MODULE_NAME[0]="${_pkgbase}"
	PACKAGE_VERSION="${pkgver}"
	DEST_MODULE_LOCATION[0]="/kernel/drivers/net/ethernet/aquantia"
	AUTOINSTALL="yes"
EOF
}
