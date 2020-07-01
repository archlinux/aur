# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bul cat ceb ces
chi_sim chi_tra chr cym dan dan_frak deu deu_frak dzo ell eng enm epo
equ est eus fas fin fra frk frm gle glg grc guj hat heb hin hrv hun
iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm kir kor kur
lao lat lav lit mal mar mkd mlt msa mya nep nld nor ori pan pol
por pus ron rus san sin slk slk_frak slv spa spa_old sqi srp srp_latn
swa swe syr tam tel tgk tgl tha tir tur uig ukr urd uzb uzb_cyrl vie yid)

pkgbase=tesseract-data
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}; done))
epoch=2
pkgver=4.0.0
pkgrel=1
pkgdesc="An OCR programm"
arch=(any)
url="https://github.com/tesseract-ocr/tessdata"
license=("APACHE")
depends=()
source=($pkgbase-$pkgver.tar.gz::https://github.com/tesseract-ocr/tessdata/archive/$pkgver.tar.gz)
sha256sums=('38c637d3a1763f6c3d32e8f1d979f045668676ec5feb8ee1869ee77cedd31b08')

build() {
  true
}

# Declare the package functions for data
for l in ${_langs[@]}; do
    eval "
package_tesseract-data-${l}(){
    pkgdesc=\"Tesseract OCR data ($l)\"
    depends=('tesseract')
    groups=('tesseract-data')

    mkdir -p \$pkgdir/usr/share/tessdata
    cp \$srcdir/tessdata-$pkgver/${l}.* \$pkgdir/usr/share/tessdata/
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done
