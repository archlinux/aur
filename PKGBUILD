# Maintainer: didi2002 <didi2002 at mailbox . org>
_pkgbase=r8126
pkgname=r8126-dkms
pkgver=10.013.00
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8126"
arch=('x86_64')
url='https://www.realtek.com/Download/List?cate_id=584'
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
conflicts=("${_pkgbase}")
source=("https://gitlab.com/didi2002/${_pkgbase}/-/archive/${pkgver}/${_pkgbase}-${pkgver}.tar.gz"
        'dkms.conf'
        '100-fix-build-with-linux-6.9.patch')
sha256sums=('092c514df0d37ff6c7e5e21ca1d6943853e403dba1f115eab3c9b96b263cca0d'
            '936bd24befc34fd6f9d5742f301a0b87bc18340223958fbe2676fc5c061eaa81'
            '06485d26db08288bfb3d72a3f9659702286af0804b89edc5353c706612fba97d')

prepare() {
  cd ${_pkgbase}-${pkgver}

  # Patch
  patch -p1 -i "${srcdir}"/100-fix-build-with-linux-6.9.patch
}

package() {
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 dkms.conf "${_pkgbase}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
