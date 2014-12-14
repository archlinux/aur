# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et ft=sh:

pkgname=qutebrowser-git
pkgver=r3206.3622f35
pkgrel=3
pkgdesc="A keyboard-driven, vim-like browser based on PyQt5 and QtWebKit"
arch=(any)
url="http://www.qutebrowser.org/"
license=('GPL')
depends=('python>=3.4' 'python-setuptools' 'python-pyqt5>=5.2' 'qt5-base>=5.2'
         'qt5-webkit>=5.2' 'libxkbcommon-x11' 'python-pypeg2' 'python-jinja'
         'python-pygments')
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
source=('git+https://github.com/The-Compiler/qutebrowser.git'
        'qutebrowser-git.install')
sha256sums=('SKIP'
            '3622243cf88eef2bb3381fec5e3cede59288b263a0ef6387510e0ad92e2cb690')
install=qutebrowser-git.install

pkgver() {
  cd "$srcdir/qutebrowser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/qutebrowser"
  python scripts/asciidoc2html.py
  a2x -f manpage doc/qutebrowser.1.asciidoc
  python setup.py build
}

package() {
  cd "$srcdir/qutebrowser"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 doc/qutebrowser.1 "$pkgdir/usr/share/man/man1/qutebrowser.1"
  install -Dm755 qutebrowser.desktop \
    "$pkgdir/usr/share/applications/qutebrowser.desktop"
  install -Dm755 icons/qutebrowser-16x16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-24x24.png \
    "$pkgdir/usr/share/icons/hicolor/24x24/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-48x48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-96x96.png \
    "$pkgdir/usr/share/icons/hicolor/96x96/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-256x256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser-512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/qutebrowser.png"
  install -Dm755 icons/qutebrowser.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/qutebrowser.svg"
}
