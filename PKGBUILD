# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.7.5
pkgrel=2
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
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            '4f9650ac44246f63148a17b2ade5bb81587d98a20449910ca3dc9ddf7a21bb92de22be71fb0248d6ab702ba9a5da0fbd305a17bb1c9ec618012c4e150207ab7f')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 < "${srcdir}/${pkgname}.patch"
  
}

