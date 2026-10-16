# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.11.0
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
sha512sums=('e7b1d8e3502c4a7adee8de051c07012eacfd0ae9a4095d4280db6ec7b5e5c852571e695d2ca32f2e918b0e8bdf83451fc1194908c1922b603a32602b114868bf'
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            '530e8ecef6e747d985e0b5ea8b52791dc511a036c459223f45afa4393e5483a50e19ea69f229da13a3ed73d0ecd3d1d69eaa89f82c52dc86c755984daaa7483e')
options=(!debug)

package() {

  tar -xf data.tar.zst -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 <"${srcdir}/${pkgname}.patch"

}
