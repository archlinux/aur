# Maintainer: Stefan Dimitrijevic <stefanstele95@hotmail.com>

pkgname='linvam'
pkgver=0.6.3
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
)
depends=(
  'xorg-xinput'
  'python'
  'python-pyqt6'
  'python-srt'
  'python-requests'
  'python-tqdm'
  'python-sounddevice'
  'python-vosk-bin'
  'ffmpeg'
  'ydotool'
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
sha256sums=('565f46e4efc2b57a7f31995a0c56e8a48579bc6ee6bea287ec8d2049534afb4e')
options=('debug')
install=linvam.install

build() {
  current_CFLAGS=$CFLAGS
  export CFLAGS=''
  cd "LinVAM-$pkgver"/scripts
  source ./build.sh
  export CFLAGS=$current_CFLAGS
}

package() {
  install "LinVAM-$pkgver"/src/LinVAM.desktop -Dm644 "$pkgdir/usr/share/applications/LinVAM.desktop"
  install "LinVAM-$pkgver"/scripts/linvam -Dm755 "$pkgdir/usr/bin/linvam"
  install "LinVAM-$pkgver"/scripts/linvamrun -Dm755 "$pkgdir/usr/bin/linvamrun"
  install "LinVAM-$pkgver"/LICENSE.txt -Dm644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install "LinVAM-$pkgver"/rules/12-input.rules -Dm644 "$pkgdir/etc/udev/rules.d/12-input.rules"
  install "LinVAM-$pkgver"/rules/50-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/50-uinput.rules"
  install "LinVAM-$pkgver"/rules/80-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
