# Submitter: Steffen Weber <boenki-gmx-de>
# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffdiaporama
pkgver=2.1
pkgrel=1
pkgdesc='ffDiaporama'
arch=(x86_64)
url=http://ffdiaporama.tuxfamily.org
license=(GPL2)
depends=('ffmpeg21' 'sdl' 'sdl_mixer' 'qt5-base' 'qt5-tools' 'qt5-svg' 'sqlite' 'qt5-imageformats' 'exiv2' 'taglib')
provides=(

)
makedepends=(
  gcc
)
source=('http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_bin_2.1.2014.0209.tar.gz')
md5sums=('f9f46277153cf49f6947973778516adb')

build() {
  cd ffDiaporama
  sed -i 's@GTK;GNOME;Qt;KDE;AudioVideo;@AudioVideo;Player;X-Red-Hat-Base;@g' ffDiaporama.desktop
  qmake-qt5 'QMAKE_CFLAGS_ISYSTEM=-I' ffDiaporama.pro /PREFIX=/usr
  
  make "-j$(nproc)" || return 1
}

package() {
  cd ffDiaporama

  make INSTALL_ROOT="$pkgdir" install
}
