# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sng <sng at hellug dot gr>
# Contributor: aksr <aksr at t-com dot me>

_pkgname=pyradio
pkgname=$_pkgname-git
pkgver=0.6.0.r0.gd13b7e3
pkgrel=1
pkgdesc="Command line internet radio player"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('ncurses' 'python')
optdepends=('mplayer: as backend' 'vlc: as backend' 'mpv: as backend' 'socat: if mpv is used')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/coderholic/pyradio.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  descr="$(git describe --long --tags)"
  sed -i "s/git_description = ''/git_description = '$descr'/" pyradio/radio.py
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/pyradio/README.md"
  install -Dm644 README.html "$pkgdir/usr/share/doc/pyradio/README.html"
  install -Dm644 build.md "$pkgdir/usr/share/doc/pyradio/build.md"
  install -Dm644 build.html "$pkgdir/usr/share/doc/pyradio/build.html"
  gzip pyradio.1
  install -Dm644 pyradio.1.gz "$pkgdir/usr/share/man/man1/pyradio.1.gz"
  # We don't have to install stations.csv, it is already in the egg file
  #install -Dm644 pyradio/stations.csv "$pkgdir/usr/share/doc/pyradio/stations.csv"
}

