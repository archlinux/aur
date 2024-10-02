# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.8.0
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
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}-jammy_amd64.deb"
  'dpkg'
  'eparakstitajs3.patch')
sha512sums=('79ca9b06ed5a04f46b69ae80b50878f2ed709689c38bb32f4eb91a8788124eaafb77e724d30efcb5350d5a91195edeebe444e107f343fefffeb8e44581c437cb'
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            '4f67c847832fb4c6c724a90677a3564d85145ecb6ff386460bbba65a63bcd3cfd2e7116c6bce085521351f13f697d8621a4303d400f0ba7b9a57cd2173bbeb0e')

package() {

  tar -xf data.tar.zst -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 <"${srcdir}/${pkgname}.patch"

}
