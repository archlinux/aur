pkgname=xyplayer-git
_pkgname=xyplayer
pkgver=143.fe18293
pkgrel=1
pkgdesc="A simple but feature-rich online music player using pyqt4"
arch=('i686' 'x86_64')
url="https://github.com/Zheng-Yejian/xyplayer"
license=('GPL')
depends=('python-pyqt4' 'phonon-qt4-vlc' 'python-qscintilla')
makedepends=('git' 'python-setuptools')
provides=('xyplayer')
conflicts=('xyplayer')
source=("git://github.com/Zheng-Yejian/xyplayer.git" "setup.py" "xy.desktop" "mutagen.patch")
md5sums=('SKIP' '74b643383a33d6858f6d6939d3ea2e0c' 'e7608704fd763984e13121970f4d02d4' '96be4e424041833c33f8b27a0b45081a')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir"
  patch -Np0 -i mutagen.patch
}

package() {
  cd "$srcdir"
  cp setup.py $_pkgname
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm755 xyplayer.py "$pkgdir/usr/bin/xyplayer"
  install -Dm644 "resources/icons/xyplayer.png" "$pkgdir/usr/share/icons/hicolor/xyplayer.png"
  install -Dm644 "resources/sounds/error_happened.ogg" "$pkgdir/usr/share/sounds/error_happened.ogg"
  cd "$srcdir"
  install -Dm644 xy.desktop "$pkgdir/usr/share/applications/xy.desktop"
}
