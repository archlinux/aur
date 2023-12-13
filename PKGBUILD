# Maintainer: Glaumar glaumar2018@outlook.com
_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
    chi_sim chi_tra chr cos cym dan dan_frak deu deu_frak div dzo ell enm epo
    equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
    hin hrv hun hye iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm
    kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
    mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
    slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
    tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

pkgname=poptranslate
pkgver=0.4.0
pkgrel=1
pkgdesc="Translate the text selected by the mouse on plasma wayland"
arch=(x86_64)
url="https://github.com/glaumar/PopTranslate"
license=(GPL3)
depends=(hicolor-icon-theme
    qt5-base
    qt5-multimedia
    kxmlgui5
    kwindowsystem5
    kglobalaccel5
    kguiaddons5
    kwidgetsaddons5
    kwayland5
    qcoro-qt5
    leptonica
    tesseract
    tesseract-data-eng
    )
optdepends=($(for l in ${_langs[@]}; do echo tesseract-data-${l}; done))
makedepends=(cmake git qt5-tools)
provides=(poptranslate)
source=("git+https://github.com/glaumar/PopTranslate.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/PopTranslate/"
  git submodule update --init
}

build() {
    cmake -B build -S "PopTranslate" -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target poptranslate
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}