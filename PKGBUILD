# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contritutor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

# prepared using:
#   ls -1 | /usr/bin/grep traineddata | cut -d"." -f 1 | tr '\n' ' '
_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
chi_sim chi_tra chr cos cym dan dan_frak deu deu_frak div dzo ell eng enm epo
equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
hin hrv hun hye iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm
kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

pkgbase=tesseract-data-git
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}-git; done))
pkgver=4.1.0.r0.g4767ea9
pkgrel=1
pkgdesc="Trained language data for tesseract OCR Engine"
arch=('any')
url="https://github.com/tesseract-ocr/tessdata"
license=('Apache')
depends=('tesseract')
groups=('tesseract-data-git')
source=('tessdata::git+https://github.com/tesseract-ocr/tessdata.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tessdata"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

for l in ${_langs[@]}; do
    eval "
package_tesseract-data-${l}-git(){
    provides=('tesseract-data-${l}')
    conflicts=('tesseract-data-${l}')

    cd \"\$srcdir/tessdata\"
    mkdir -p \"\$pkgdir/usr/share/tessdata\"
    cp ${l}.* \"\$pkgdir/usr/share/tessdata/\"
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done

