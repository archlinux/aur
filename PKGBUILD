_pkgbase=atlantic
pkgname="${_pkgbase}-dkms"
pkgver=2.4.14
pkgrel=1
pkgdesc="aquantia multigigabit nic driver - \"development preview\""
url="https://github.com/Aquantia/AQtion"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
makedepends=('linux-headers')
conflicts=("${_pkgbase}")
commit="c12137f82bf867240a695872b4b95f23218798f4"
source=("https://github.com/Aquantia/AQtion/archive/$commit.tar.gz")
sha512sums=('619db09df21bfff8d08ed08c6148e325e62934cee2931d618a08a0869630cc30c3beac5f2af504f00ae91d715138b01b8e1522056ddb5151aa3ae6ea125c1822')

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
