# Maintainer: librebob librebob@protonmail.com
pkgname=athenaeum-git
_pkgname=athenaeum
pkgver=0.1
pkgrel=1
_pkgrel=1
pkgdesc="A libre replacement for Steam"
arch=(any)
url="https://gitlab.com/librebob/athenaeum"
license=('GPL-3.0-or-later')
depends=('flatpak' 'python3' 'pyqt5-common' 'python-pyqt5' 'python-sip-pyqt5' 'python-peewee' 'python-xdg' 'python-dateutil' 'qt5-base' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-declarative' 'sqlite')
makedepends=('git')

source=("git+https://gitlab.com/librebob/athenaeum.git")
md5sums=('SKIP')
_gitname=athenaeum

package() {
  cd $srcdir/$_pkgname

  for i in 32 48 64 96 128 256 512; do
    install -Dm644 $_pkgname/resources/icons/hicolor/${i}x${i}/athenaeum.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 $_pkgname/resources/$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  python setup.py install --root="$pkgdir" --optimize=1 --prefix=/usr
}
