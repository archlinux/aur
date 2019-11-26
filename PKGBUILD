_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.3.1
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="3c2a2a3abe3df6cb0c985a49cea9a359a83e3f75"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
md5sums=('2a916d439a8171878d5cc85a1810d160')

build() {
  cd "${srcdir}/AQtion-${commit}"
}

package() {
  cd "${srcdir}/AQtion-${commit}"
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
