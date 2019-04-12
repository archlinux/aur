# Maintainer: librebob librebob@protonmail.com
pkgname=athenaeum-git
_pkgname=athenaeum
_pkgdomain=com.gitlab.librebob.Athenaeum
pkgver=r141.668867a
pkgrel=1
pkgdesc="A libre replacement for Steam"
arch=(any)
url="https://gitlab.com/librebob/athenaeum"
license=('GPL-3.0-or-later')
depends=('flatpak' 'python' 'pyqt5-common' 'python-pyqt5' 'python-sip-pyqt5' 'python-peewee' 'python-dateutil' 'qt5-base' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-declarative' 'sqlite')
makedepends=('git')

source=("git+https://gitlab.com/librebob/athenaeum.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd $srcdir/$_pkgname

  for i in 32 48 64 96 128 256 512; do
    install -Dm644 $_pkgname/resources/icons/hicolor/${i}x${i}/$_pkgdomain.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgdomain.png"
  done

  install -Dm644 $_pkgname/resources/$_pkgdomain.desktop \
    "$pkgdir/usr/share/applications/$_pkgdomain.desktop"

  install -Dm644 $_pkgname/resources/$_pkgdomain.appdata.xml \
    "$pkgdir/usr/share/appdata/$_pkgdomain.appdata.xml"

  python setup.py install --root="$pkgdir" --optimize=1 --prefix=/usr
}
