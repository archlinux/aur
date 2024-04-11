# Maintainer: Stefan Dimitrijevic <stefanstele95@hotmail.com>

pkgname='linvam-git'
pkgver=v0.6.3.r0.gfbc492f
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
source=('git+https://github.com/stele95/LinVAM.git')
sha256sums=('SKIP')
install=linvam.install

pkgver() {
  cd LinVAM
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  current_CFLAGS=$CFLAGS
  export CFLAGS=''
  cd LinVAM/scripts
  source ./build.sh
  export CFLAGS=$current_CFLAGS
}

package_linvam-git() {
  pkgdesc+=' (GIT version)'

  install LinVAM/src/LinVAM.desktop -Dm644 "$pkgdir/usr/share/applications/LinVAM.desktop"
  install LinVAM/scripts/linvam -Dm755 "$pkgdir/usr/bin/linvam"
  install LinVAM/scripts/linvamrun -Dm755 "$pkgdir/usr/bin/linvamrun"
  install LinVAM/LICENSE.txt -Dm644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install LinVAM/rules/12-input.rules -Dm644 "$pkgdir/etc/udev/rules.d/12-input.rules"
  install LinVAM/rules/50-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/50-uinput.rules"
  install LinVAM/rules/80-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
