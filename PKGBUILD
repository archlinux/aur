# Maintainer: Christopher KOBAYASHI <software plus aur at disavowed dot jp>

pkgname="asix-ax99100-dkms"
pkgdesc="DKMS driver for ASIX AX99100 PCIe-to-serial/parallel controller"
pkgver=1.8.0
pkgrel=2
arch=('any')
url='https://www.asix.com.tw/'
license=('GPL')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch' 'linux-headers')
_srcdir="AX99100_SP_PP_SPI_Linux_Driver_v${pkgver}_Source"
depends=('dkms')
source=("${_srcdir}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1229"
	'fix_deprecated.patch'
	'dkms.conf'
	)

sha256sums=('d4eda7e48f335e670c6f5286d744dcf111aaa7304dc921ac89089cf253e5cf1d'
	    '57158e2b13ff7631988484fd74c5727f936f1b753b68ea3d3ce4ff8ad7b7ff81'
	    'da8f1e1129ff86162b4a38dd4bffc56f716a0968f7cb81241f339a85c06cbbb4'
	)

package() {
  cd "${_srcdir}"
  local install_dir="${pkgdir}/usr/src/asix-ax99100-${pkgver}"

  # Set name and version
  sed -e "s/@_PKGNAME@/asix-ax99100/" -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf" > dkms.conf
  patch -p1 < ../fix_deprecated.patch
  mkdir -p "${install_dir}"
  cp -r * "${install_dir}"/
}
