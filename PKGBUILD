# Maintainer: killermoehre <killermoehre@gmx.net>

pkgname='ca-certificates-bsi'
pkgver='20260916'
pkgrel='1'
pkgdesc='Bundesamt für Sicherheit in der Informationstechnik Root Certificates'
arch=('any')
url='https://www.bsi.bund.de/DE/Themen/Oeffentliche-Verwaltung/Moderner-Staat/Verwaltungs-PKI/Wurzelzertifizierungsstelle/FingerprintsderWurzelzertifikate/fingerprintsderwurzelzertifikate_node.html'
license=('unknown')
depends=('ca-certificates-utils>=20181109-3')

source=(
    'PCA-1-Verwaltung-17_zip.zip::https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/VerwaltungsPKI/PCA/Wurzelzertifikate/PCA-1-Verwaltung-17_zip.zip?__blob=publicationFile&v=2'
    'PCA-1-Verwaltung-20_zip.zip::https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/VerwaltungsPKI/PCA/Wurzelzertifikate/PCA-1-Verwaltung-20_zip.zip?__blob=publicationFile&v=2'
    'PCA-1-Verwaltung-23_zip.zip::https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/VerwaltungsPKI/PCA/Wurzelzertifikate/PCA-1-Verwaltung-23_zip.zip?__blob=publicationFile&v=3'
    'PCA-1-Verwaltung-26_zip.zip::https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/VerwaltungsPKI/PCA/Wurzelzertifikate/PCA-1-Verwaltung-26_zip.zip?__blob=publicationFile&v=2'
)

sha256sums=(
    'db8ce90cbfdd9678f32e8792f15e892359801d1fddd46c1a44336a2696c4ec47'
    'c2be92c594a429366b24d1b412972f192f67dc53af852c07d78e1b5574042946'
    '51f07026e498896e55dc940e6ea4def76ec29b363ee6c07a50fbdc05cb280b66'
    '286160acb815372358f8355703e1dfa05f488b4742f4838e1f0ffd26507c2e46'
)

package() {
    local _certdir="${pkgdir}/usr/share/ca-certificates/trust-source/anchors"
    local -a _certs=()
    mapfile -t _certs < <(find . -name '*.cer')
    install -d "$_certdir"
    install -t "$_certdir" -m644 "${_certs[@]}"
}
