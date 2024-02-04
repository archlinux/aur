# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=0.1.2
pkgrel=4
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL-3.0-or-later')
depends=('ffmpeg4.4' 'frei0r-plugins' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'doxygen' 'graphviz' 'qt5-tools')
optdepends=('olive-community-effects-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olive-editor/olive/archive/$pkgver.tar.gz"
        "olive-0.1.2-appdata-desktop.patch"
        "olive-0.1.2-cacher.patch"
        "olive-0.1.2-clickablelabel.patch"
        "olive-0.1.2-FlowLayout.patch"
        "olive-0.1.2-proxygenerator.patch"
        "olive-0.1.2-QFontMetrics.patch"
        "olive-0.1.2-QPainterPath.patch"
        "olive-0.1.2-QWheelEvent.patch")
b2sums=('54d157743579b9a55214f8c3c2df5417abe9686ea8be9e6a4e3f9d8e2a43ce2856d25ceca6c70f7ad1f590e63eb347e4e80bce1627b15ee96146ab3da5b35c9e'
        'be6ce01a57720cf5ad90b4d444794275f919f3cdf834774a4a46345b05f40c61a6edf413bba704cc5f8aafc00c3ca3ffc6a48ccd4e67e735c7a638a25b73d647'
        'e77881a5d24f325bb9cf948d97e5da15dede744db2f4a476ae866e7b2cf9d31f04a9f80afe39a815fa577041311e7bc01c6fda5dc12a0be67cc0eff23b6449ca'
        '43797c5cc755e677b57d6d324da54729aff55c72b671a0ed724435e7facaf04084671061400e1aa0220e67766ac999c5d28ca750cc780b1176528560dd2c343b'
        '71ee76e2f53c1ea08b1294c5f9ae00c34174029fc0b4a3e43abc794f83b0403128175356cd6d8dd95d3cecfae5934499e97956634586dcb96a931d399ec052d2'
        '61eac984bc8465fe501bac293d86318c420a288b2f9174a861664654ee167c51dff3fc778d3d5c6c8d59e87639020bdea6c45cc54f0da6780374a125cc87d0dc'
        '102b98287b16b65740d3abbd4fa38e5489e0bcefe81513b3d0dca5b87490156e4f464ef2666dd961dc57441dab884a2e3bd7d04396d40dcc7f751d43b8cc94e2'
        '41826012b0792ae7d201ed671c3e2a2369232d921b6485d3b631ed3c9941522025e208005b03e4f16a541acb575d10d3448143307518c5161c3ca77191000353'
        'b83e25cae107a03b92e234e5d183075eef3f48402b3c80ff6499641c04142cd98a5d1089d2ee7006b10f7e0cb510abf2f1603678e13d5d1a46ca7c596660ced8')

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-appdata-desktop.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-cacher.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-clickablelabel.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-FlowLayout.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-proxygenerator.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-QFontMetrics.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-QPainterPath.patch"
  patch --forward --strip=1 --input="${srcdir}/olive-0.1.2-QWheelEvent.patch"
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_PREFIX_PATH="/usr/lib/ffmpeg4.4;/usr/include/ffmpeg4.4" \
        ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
