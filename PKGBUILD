# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.1.1
pkgrel=1
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.pmlp.gov.lv"
license=('LGPL')
groups=('eparaksts')
provides=('eidlv-pintool')
depends=('gtk2' 'openssl-1.0' 'libsm' 'pcsclite' 'glu')
optdepends=('nss: modutil tool for installing PKCS#11 module')
makedepends=('binutils' 'tar')
install='middleware.install'
# source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://www.pmlp.gov.lv/sites/pmlp/files/media_file/latvia-eid_${pkgver}-1_ubuntu_0.zip"
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-1_amd64.deb"
        "pintool.patch")
sha512sums=('578bc8a6544f6cb000dda62d9c5fe9d49425b1042a0b0fe4e637e4dada5a28a2c9c1d4bae27370a1f481f6f140f75c7718db1485cdf95c55e4dce64d3ea965c2'
            'a3bd51369a014d8ca1ee10ef0613573cc500c6f2eacbf912422075bebedb11e9ed522e42e343cff1a641fc3bec7b947f6aa86fbe94e3e1a39591c6fb0fde368c')
# DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla" -fLC - --retry 3 --retry-delay 3 -o %o %u')

package() {
  ar x "${pkgname}_${pkgver}-1_amd64.deb"

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

  cd "${pkgdir}"
  patch --forward --strip=1 < "${srcdir}/pintool.patch"

}
