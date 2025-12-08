# Maintainer: Stefan Dimitrijevic <stefanstele95@hotmail.com>

pkgname='linvam'
pkgver=0.8.3
pkgrel=1
pkgdesc='Linux voice activated macros'
arch=('x86_64')
url='https://github.com/stele95/LinVAM'
license=('GPL3')
makedepends=(
  'python'
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
  'python-vosk'
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
sha256sums=('20ad59d74aeac319d32fd8829e2216002469ebf9bf109cc43435e694a2a0140f')
install=linvam.install

build() {
  cd "${srcdir}/LinVAM-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/LinVAM-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install LinVAM.desktop -Dm644 "$pkgdir/usr/share/applications/LinVAM.desktop"
  install linvam/assets/icons/linvam.svg -Dm644 "$pkgdir/usr/share/icons/hicolor/scalable/apps/linvam.svg"
  install LICENSE.txt -Dm644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install rules/12-input.rules -Dm644 "$pkgdir/etc/udev/rules.d/12-input.rules"
  install rules/50-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/50-uinput.rules"
  install rules/80-uinput.rules -Dm644 "$pkgdir/etc/udev/rules.d/80-uinput.rules"
}
