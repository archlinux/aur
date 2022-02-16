_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.5.3
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="4a60d43279cd72ee59b08cef4060c4c640efa8a7"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
sha512sums=('d75ae1263efe80499e8b6dd6e69a15a7ebadf3a860324f4806759d07c3403ce8f52699ec5368fe16e5c070155cc6cf3f74af5c51ddefa563975549f88e1a5f8f')

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
