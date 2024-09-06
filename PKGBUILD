# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.7.5
pkgrel=3
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LicenseRef-E-PARAKSTĪTĀJS_3')
groups=('eparaksts')
depends=('gtk3' 'java-runtime' 'alsa-lib' 'libxtst')
optdepends=('python-nautilus: Nautilus context menu integration'
            'eparaksts-token-signing: eParaksts browser plugins'
            'latvia-eid-middleware: libraries for Latvia eID cards')
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}-focal_amd64.deb"
        'dpkg'
        'eparakstitajs3.patch')
sha512sums=('9376c96c722ea0da498daf65f09ec196d9f487641e45edffef1d4c7b089e66652fc7c98fa9e90d8c03b9c42d07ea13500e82cc579eb28e013120649958eb95e2'
            '88b8d0b93aa515715c3aaaa8c9487073c15e4b1adc7bfa1e7a025a4f49d55bd3497cda312d045d595d2401e47fdea4cfa88d9d88eede812a8ed4c26e97060953'
            '4f9650ac44246f63148a17b2ade5bb81587d98a20449910ca3dc9ddf7a21bb92de22be71fb0248d6ab702ba9a5da0fbd305a17bb1c9ec618012c4e150207ab7f')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 < "${srcdir}/${pkgname}.patch"
  
}

