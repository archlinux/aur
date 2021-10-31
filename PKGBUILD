# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=autofirma-bin
pkgver=1.6.5
pkgrel=5
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL' 'custom:EUPL')
depends=('java-runtime=11')
conflicts=('autofirma' 'autofirma-git')
source=("${pkgname}-${pkgver}.zip::https://sede.xunta.gal/ficheiros/autofirma/AutoFirma_Linux.zip"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg")
sha256sums=('28da745ea3084ba87b56eba31bc994e60872384c893c91f3e4aad3db4967d939'
            'd008cd566c7e7276f1887ec337c9ebfe0676ac45addd2040a9e35fc4f5d9ed64'
            '062cf72219e592e06218e47ea2a212d6517be66f0d4c58dcd03ef18d5c39300b'
            '428c5b7300dde7158a1a0918c8d2e8188f042dbc143d991c03f51d1c8a40efa4'
            'f7e525586103db08a2a38ccefdef93cc02407728de8b214e53ae3dc0631bab75')

prepare() {
  # Extract debian package
  bsdtar -O -xf AutoFirma*/*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -
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
