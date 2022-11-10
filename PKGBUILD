# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.6.6
pkgrel=1
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('custom:E-PARAKSTĪTĀJS 3')
groups=('eparaksts')
depends=('gtk2' 'java-environment' 'libnet' 'alsa-lib' 'libxtst' 'libibus' 'goocanvas')
optdepends=('python-nautilus: Nautilus context menu integration'
            'eparaksts-token-signing: eParaksts browser plugins'
            'latvia-eid-middleware: libraries for Latvia eID cards')
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}-focal_amd64.deb"
        'dpkg'
        'eparakstitajs3.patch')
sha512sums=('a3b7fdd7b0718e2073f954cc61289d89a01acf28e7c86f29b6c8ee81b26e888aca08cb70f4a44f3338e70143ff812149db85080e5f868520c93dfac98a4c0264'
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            '95e24c268c023cb52b710752e71922947a956ed07b1e75e90c6ce05124ac6b4b8759ab32b516daf2bf8d73f620ecd2eef637ed9b7b58f9360c445fdcad74ea9b')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  install -D "${srcdir}/dpkg" "${pkgdir}/usr/lib/eparakstitajs3/bin/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=0 < "${srcdir}/${pkgname}.patch"
  
}

