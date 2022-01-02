# Maintainer: willemw <willemw12@gmail.com>
# Contributor: shirokuro <tod dot jackson at gmail dot com>
# Contributor: sergej

pkgname=ted
pkgver=2.23
pkgrel=11
pkgdesc="Lightweight RTF text processor"
arch=('x86_64')
url="https://www.nllgg.nl/Ted/"
depends=('freetype2' 'ghostscript' 'gtk2' 'libjpeg' 'libpaper' 'libpng' 'libtiff' 'libxpm' 'pcre' 'zlib')
license=('GPL')
makedepends=('inetutils' 'lsb-release')    # hostname and lsb_release commands
options=(!makeflags)
source=(https://ftp.nluug.nl/pub/editors/$pkgname/$pkgname-$pkgver.src.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_nl_NL.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_en_GB.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_de_DE.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_es_ES.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_es_AR.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_pt_PT.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_pt_BR.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_fr_FR.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_it_IT.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_cs_CZ.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_da_DK.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_sv_SE.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_nb_NO.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_pl_PL.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_sk_SK.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_hu_HU.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_mg_MG.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_bg_BG.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_ru_RU.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_hr_HR.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/ted_fi_FI.tar.gz
        https://ftp.nluug.nl/pub/editors/ted/TedDocument-de_DE.rtf
        https://ftp.nluug.nl/pub/editors/ted/TedDocument-fr_FR.rtf
        https://ftp.nluug.nl/pub/editors/ted/TedDocument-mg_MG.rtf)
md5sums=('4199df0deb82a90450135ec3f2b7d915'
         'e68939d2d8533491c8c14bd380d6650c'
         '3f43d0fe3ac66f21943f547f2080e478'
         '365d845cd318c426354c1743d7104341'
         '18c278f719f6df68200a15e198c8a88e'
         '5592f169ce8da6693f0b5ec37be9146a'
         '4ee2915dd3d3ee6f402ab60212ee235c'
         '0bef013ea7ae99897b0ae4779257207b'
         '9ab767df1d476cbe93af9ba07d0b2992'
         '412034b993f37f0c7bb8dbd4c0200618'
         '28230070a46ea5a341cfe1600c66704b'
         'b72a7444ff831c443152c4eb489263a1'
         'e27b02e5196c59c038f4510a608c76df'
         'c24cda500db0c8a9a6f9674d4e1e30d1'
         'd6e33a8001561bc89becebd006283360'
         '125791b19f33ed94727008d8563e652f'
         '7c2db94442f9d1c5b2eb42157a9e01f3'
         '674ccafc2121288f8d344976308bea4b'
         '4e488f8025a793e5d171770dfa2f85d7'
         '4a32b49850244be6ed973e810ca7467e'
         '888f70f17c5f16c4bd1fc9fb8b954fb2'
         'dd1bf4cf1142732a3152899e548101b0'
         'fc92fda9a49aa309fefdf6a682028b2d'
         '4efb63d391b1196983fdcc1bcf751bc7'
         '63b39a2bd36790f2164cf80dfab603aa')

build() {
  cd Ted-$pkgver
  make -j1
  make package -j1
}

package() {
  install -dm755                    "$pkgdir/usr/share/Ted"
  install -m644 TedDocument-*_*.rtf "$pkgdir/usr/share/Ted"

  cd Ted-$pkgver/tedPackage
  DESTDIR="$pkgdir" make -j1 install

  cd "$pkgdir"
  for _file in "$srcdir/"ted_*_*.tar.gz; do
    tar xf "$_file"
  done
}

