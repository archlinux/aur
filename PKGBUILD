# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: Alberto Gómez <no publicado>
# Maintainer: Víctor González <mrvikxd@gmail.com>

pkgname=autofirmaja
pkgver=1.6.0.jav5
pkgrel=1
pkgdesc='Cliente de firma electrónica de la Junta de Andalucia'
arch=('any')
url='https://desarrollo.juntadeandalucia.es/recursos/activo/autofirma'
license=('GPL-2.0-or-later AND EUPL-1.1')
depends=('java-runtime=11')
source=("${pkgname}-${pkgver}.deb::https://desarrollo.juntadeandalucia.es/sites/default/files/2023-11/autofirma_v1_6_0_jav05-linux.deb"
        "autofirmaja"
        "autofirmaja.desktop"
        "autofirmaja.js"
        "autofirmaja.svg"
        "eupl-1.1.txt")
noextract=("${pkgname}-${pkgver}.deb")
b2sums=('341f6434ce9518c9564a7db2db5f0e398ffabf4241de4e3457f8d94c7fc5ebe93cea78e9bee55900addac2e94b1731d343eba96b1bdd162ea66d1f8a64b40b18'
        'e8b11f01f770be19253ecd460239136f004d6adc24e333094a90e54609df40ad4760cea0d139d4741aadb7cd485004f4a59c248f71807cf8d03e49bee890de23'
        'fb8f3090880400a969dd0f3fae1a50ecbf4f9aafe1beef8c7864696d86ca7b7a19065d7a878730b7391aacc3f70e0939dea9bff2adad2caa268fa48f1effb0d9'
        '4fffa7bce59647d89275aacf1f94c63f7ef8994fa4f6e5487528dc7b812a0943d0ddaa083f95c8bf89388bb31d337773ec50b6db25eb76c0dcfe91d1c85b98dd'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '3ec804ae210f767d9f20d17b364e4b25523d44a07f9cedeffd5fb1cefd4be51ef7374fa58c7b060c548b4ebd43d84fbe149ae42c5befcbab5ab42485d0b2a672')

prepare() {
  # Extract debian package
  bsdtar -O -xf *.deb data.tar.zst | bsdtar -C "${srcdir}" --zstd -xf -
}

package() {
  install -Dm755 "autofirmaja" \
    "${pkgdir}/usr/bin/autofirmaja"
  install -Dm644 "autofirmaja.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/autofirmaja.js"
  install -Dm644 "usr/lib/AutoFirmaJA/AutoFirmaJA.jar" \
    "${pkgdir}/usr/share/java/autofirmaja/autofirmaja.jar"
  install -Dm644 "autofirmaja.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirmaja.svg"
  install -Dm644 "autofirmaja.desktop" \
    "${pkgdir}/usr/share/applications/autofirmaja.desktop"
  install -Dm644 "eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirmaja/EUPL"
}
