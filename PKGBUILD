_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.5.5
pkgrel=1
pkgdesc="aquantia multigigabit nic driver"
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="340d608726cbfa04b6046d74a362e788e1e17d45"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
sha512sums=('d180b4d432e845fff5f78da9c5fad5166fd5baa07841a5d3acde9667b8805585c9d6530eacb8854d1f60b8547318ffda132030b83cc7d0b0ebbcb2a47ddbe0a7')

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
