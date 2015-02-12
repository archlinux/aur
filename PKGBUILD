# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et ft=sh:

pkgname=qutebrowser
pkgver=0.1.3
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5 and QtWebKit"
arch=(any)
url="http://www.qutebrowser.org/"
license=('GPL')
depends=('python>=3.4' 'python-setuptools' 'python-pyqt5>=5.2' 'qt5-base>=5.2'
         'qt5-webkit>=5.2' 'libxkbcommon-x11' 'python-pypeg2' 'python-jinja'
         'python-pygments' 'xdg-utils' 'desktop-file-utils')
makedepends=('asciidoc')
optdepends=(
  'python-colorlog: colored logging output'
  'gst-libav: media playback'
  'gst-plugins-base: media playback'
  'gst-plugins-good: media playback'
  'gst-plugins-bad: media playback'
  'gst-plugins-ugly: media playback'
)
options=(!emptydirs)
source=("http://qutebrowser.org/releases/v$pkgver/qutebrowser-${pkgver}.tar.gz"
        'qutebrowser.install')
sha256sums=('e88fa392eb0fbf99103ec37bbad98edbd3e369086be47394150e95e699601ccd'
            '4a88871e91f894890ce96feb620e4174c686db12e4fa91b5a7306454dc96bf67')
install=qutebrowser.install

build() {
  cd "$srcdir/qutebrowser-$pkgver"
  a2x -f manpage doc/qutebrowser.1.asciidoc
  python setup.py build
}

package() {
  cd "$srcdir/qutebrowser-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 doc/qutebrowser.1 "$pkgdir/usr/share/man/man1/qutebrowser.1"
  install -Dm644 qutebrowser.desktop \
    "$pkgdir/usr/share/applications/qutebrowser.desktop"
  install -Dm644 icons/qutebrowser-16x16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-24x24.png \
    "$pkgdir/usr/share/icons/hicolor/24x24/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-48x48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-96x96.png \
    "$pkgdir/usr/share/icons/hicolor/96x96/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-256x256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser-512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/qutebrowser.png"
  install -Dm644 icons/qutebrowser.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/qutebrowser.svg"
}
