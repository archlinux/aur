# Maintainer: Anders Thomsen <mail at andersthomsen dot dk>

pkgname=pykaraoke-gst-git
pkgver=20140729
pkgrel=3
pkgdesc="A free karaoke player for Linux, FreeBSD, Windows and GP2X. GStreamer branch."
arch=('i686' 'x86_64')
url="http://www.kibosh.org/pykaraoke/index.php"
license=('LGPL')
depends=('python2-pygame' 'python2-numpy' 'wxpython' 'desktop-file-utils' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good' 'gstreamer0.10-ugly')
optdepends=('timidity++: Midi Support')
makedepends=('git')
conflicts=('pykaraoke')
install="$pkgname.install"
source=("git+https://github.com/kelvinlawson/pykaraoke.git#branch=gstreamer")
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
