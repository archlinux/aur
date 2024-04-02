# Maintainer: Stefan Dimitrijevic <stefanstele95@hotmail.com>

pkgname='linvam'
pkgver=0.5.0
pkgrel=1
pkgdesc='Linux voice activated macros'
arch=('x86_64')
url='https://github.com/stele95/LinVAM'
arch=('x86_64')
license=('GPL3')
makedepends=(
  'python'
  'nuitka'
  'git'
  'bash'
)
depends=(
  'python'
  'python-pyqt6'
  'python-srt'
  'python-requests'
  'python-tqdm'
  'python-sounddevice'
  'python-vosk-bin'
  'ffmpeg'
  'ydotool'
  'bash'
)
provides=(
  'linvam'
  'linvamrun'
)
conflicts=(
  'linvam'
  'linvamrun'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('debug')
install=linvam.install

build() {
  current_CFLAGS=$CFLAGS
  export CFLAGS=''
  cd "LinVAM-$pkgver"/scripts
  sh ./build.sh
  export CFLAGS=$current_CFLAGS
}

package() {
  install "LinVAM-$pkgver"/src/LinVAM.desktop -Dm644 "$pkgdir/usr/share/applications/LinVAM.desktop"
  install "LinVAM-$pkgver"/scripts/linvam -Dm755 "$pkgdir/usr/bin/linvam"
  install "LinVAM-$pkgver"/scripts/linvamrun -Dm755 "$pkgdir/usr/bin/linvamrun"
  install "LinVAM-$pkgver"/LICENSE.txt -Dm644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
