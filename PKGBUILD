# Maintainer: Felix Morgner <felix.morgner@gmail.com>

_pkgname=cyber
pkgname=${_pkgname}-dkms
pkgver=42.1729
pkgrel=1
pkgdesc="CYBER for your system (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/fmorgner/dev-cyber"
license=('GPL2')
depends=('dkms')
source=("https://github.com/fmorgner/dev-cyber/archive/v${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=('4f0a1bf71273536ea4441c9c67d2a5765b1b0a49a3de6b839b8e4b5a3fd22545'
            'ffb6ceffebde8148c2a094e8375d3ee1f98798a7202368df668e77317db31f33')

package() {
  cd "${srcdir}"

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}/dkms.conf"

  cd "dev-${_pkgname}-${pkgver}"

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
