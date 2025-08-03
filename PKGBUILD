# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=autofirma-bin
pkgver=1.9
pkgrel=3
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL-2.0-or-later AND EUPL-1.1')
depends=('java-runtime=17')
conflicts=('autofirma' 'autofirma-git')
provides=('autofirma')
options=('!debug' '!emptydirs')
source=("${pkgname}-${pkgver}.zip::https://firmaelectronica.gob.es/content/dam/firmaelectronica/descargas-software/autofirma${pkgver//./}/Autofirma_Linux_Debian.zip"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg")
b2sums=('227def57c2c3e61a845446f8378de8cb5003b32c893f1819cc05dfbbb7dd39ad50d3f69fefedf62167367cb4ef9e0a0de877af92c53425fde57e828aff84107f'
        'd6b40990b3248712b22d1a4b5abafd9d2683bc3c72407fd166f14f691fbd89a7c6dce43d5282e7168a07f6b5cfc14d9f3b84ec54baa8435a3372edce09233516'
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
  install -Dm644 "usr/lib/Autofirma/autofirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "usr/share/common-licenses/eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
