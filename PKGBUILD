# Maintainer: willemw <willemw12@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

_pkgname=pyradio
pkgname=$_pkgname-git
pkgver=0.4.r105.gcac4f8f
pkgrel=2
pkgdesc="Command line internet radio player"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('ncurses' 'python')
optdepends=('mplayer: as backend' 'vlc: as backend' 'mpv: as backend' 'socat: if mpv is used')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/coderholic/pyradio.git
        pyradio.1)
md5sums=('SKIP'
         '7bdeccafb6e8be6a84a6f24c1acc69de')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Dm644 pyradio.1 "$pkgdir/usr/share/man/man1/pyradio.1"

  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/pyradio/README.md"
  install -Dm644 pyradio/stations.csv "$pkgdir/usr/share/doc/pyradio/stations.csv"
} 

