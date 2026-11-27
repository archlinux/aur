# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.12.0
pkgrel=1
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LicenseRef-E-PARAKSTĪTĀJS_3')
groups=('eparaksts')
depends=('gtk3' 'java-runtime' 'alsa-lib' 'libxtst')
optdepends=('nautilus-python: Nautilus context menu integration'
  'eparaksts-token-signing: eParaksts browser plugins'
  'latvia-eid-middleware: libraries for Latvia eID cards')
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}-noble_amd64.deb"
  'dpkg'
  'eparakstitajs3.patch')
sha512sums=('59c9791c526c7b858b35ef0e5f1572f1a35013b59de01be4f3bcb372194ecb039419bbc71b7ed5fa999d57c4804609c1473fb2826bcb618e66e59a90603c5c02'
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            'a5804b199701d2f3f47737ca97e774bd1343315c763a65d847ac342e1d3a153bd7ce5f018ac987a89945451dc7c97e9e9d15b457dff06f5a8f4b16296e59a98b')
options=(!debug)

package() {

  tar -xf data.tar.zst -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 <"${srcdir}/${pkgname}.patch"

}
