# Maintainer: Anders Thomsen <mail at andersthomsen dot dk>

pkgname=pykaraoke-gst-git
pkgver=20180417
pkgrel=1
pkgdesc="A free karaoke player for Linux, FreeBSD, Windows. GStreamer branch."
arch=('i686' 'x86_64')
url="http://www.kibosh.org/pykaraoke/index.php"
license=('LGPL')
depends=('python2-pygame' 'python2-numpy' 'python2-wxpython3' 'desktop-file-utils' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
optdepends=('timidity++: Midi Support')
makedepends=('git')
conflicts=('pykaraoke')
install="$pkgname.install"
source=("git+https://github.com/AThomsen/pykaraoke.git#branch=gstreamer-1.0")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/pykaraoke"

  # python2 shebang
  sed -i "s|env python|&2|" `grep -rl "env python"`
}

build() {
  cd "$srcdir/pykaraoke"
  python2 setup.py build
}

package() {
  cd "$srcdir/pykaraoke"
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}
