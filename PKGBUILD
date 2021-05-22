# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
chi_sim chi_tra chr cos cym dan dan_frak deu deu_frak div dzo ell eng enm epo
equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
hin hrv hun hye iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm
kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

pkgbase=tesseract-data
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}; done))
epoch=2
pkgver=4.1.0
pkgrel=1
pkgdesc="An OCR programm"
arch=(any)
url="https://github.com/tesseract-ocr/tessdata"
license=("APACHE")
depends=()
source=($pkgbase-$pkgver.tar.gz::https://github.com/tesseract-ocr/tessdata/archive/$pkgver.tar.gz)
sha256sums=('990fffb9b7a9b52dc9a2d053a9ef6852ca2b72bd8dfb22988b0b990a700fd3c7')

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
