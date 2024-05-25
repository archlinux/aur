# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=autofirma-bin
pkgver=1.8.2
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL' 'custom:EUPL')
depends=('java-runtime=11')
conflicts=('autofirma' 'autofirma-git')
provides=('autofirma')
source=("${pkgname}-${pkgver}.zip::https://estaticos.redsara.es/comunes/autofirma/${pkgver//.//}/AutoFirma_Linux_Debian.zip"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg")
b2sums=('f66c7f3d12b83590a415c1d20820128b9cb2ecbbc2633703b904aace92f08a22d13a2462daaea64b36ddea6b63919242928b19af3f415e87200d7edc8d6fd229'
        '2eca1245aa7e44228fac9fbb871b90d765402ebdfeaa476fa807e7bdaedb039353980c5fdfaf560ecc943386bbee90d4ae048b85b516b4653bf699328d10fc87'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b')

prepare() {
  # Extract debian package
  bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${srcdir}" -xJf -
}

package() {
  install -Dm755 "autofirma" \
    "${pkgdir}/usr/bin/autofirma"
  install -Dm644 "autofirma.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/autofirma.js"
  install -Dm644 "usr/lib/AutoFirma/AutoFirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "usr/share/common-licenses/eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
