_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.4.7
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="37bd5ccd73ad4baff488c1d728eb8a819a7eef1f"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
md5sums=('e3ffde60633b0da60f58ec543da77acf')

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
