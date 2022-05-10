# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.0.13
pkgrel=1
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.pmlp.gov.lv"
license=('LGPL')
groups=('eparaksts')
depends=('gtk2' 'openssl-1.0' 'libsm' 'pcsclite' 'glu')
optdepends=('nss: modutil tool for installing PKCS#11 module')
makedepends=('binutils' 'tar')
install='middleware.install'
source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://www.pmlp.gov.lv/sites/pmlp/files/media_file/latvia-eid_${pkgver}-1_ubuntu_0.zip"
        "pintool.patch")
sha512sums=('cae7c4a9e56130d6e6fe63a7c3227d9f21bee39c5eb6f81dace5e98c50ad4570dd797f97d3c3f94655696046d9c5f907905f84457ebcd38a72907b44da4e68d7'
            'a3bd51369a014d8ca1ee10ef0613573cc500c6f2eacbf912422075bebedb11e9ed522e42e343cff1a641fc3bec7b947f6aa86fbe94e3e1a39591c6fb0fde368c')

package() {
  ar x "latvia-eid_${pkgver}-1_amd64.deb"

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

  cd "${pkgdir}"
  patch --forward --strip=1 < "${srcdir}/pintool.patch"

}
