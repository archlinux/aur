# Maintainer: Mateusz Janczuk <devqore@gmail.com>
pkgname=myrdp
pkgver=2018.2.1
pkgrel=1
pkgdesc="RDP manager using freerdp. Similar to Remmina, mRemoteNG, RDCMan."
arch=('any')
url="https://github.com/devqore/myrdp"
license=('GPL')
depends=('freerdp' 'python3' 'python-alembic' 'python-pyqt4'
         'python-pycryptodomex' 'python-sip-pyqt4')
makedepends=('git')
source=("myrdp.sh"
        "myrdp.desktop"
        "$pkgname::git+https://github.com/devqore/myrdp#tag=$pkgver")
sha256sums=('5ed6946ec870caa6ab5affd4f4d6603ca849e96d1ba8d82d26e44e6565a5f7f2'
            '2caadd2656255a47876ab8717afd7c622013da9d2f92cb43e229f489e4e562d8'
            'SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R "$srcdir/$pkgname/app/" "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$srcdir/myrdp.sh" "$pkgdir/usr/bin/myrdp"
  install -Dm644 "$srcdir/myrdp.desktop" "$pkgdir/usr/share/applications/myrdp.desktop"
  for f in "main.py" "LICENSE"; do
    install -Dm644 "$srcdir/$pkgname/$f" "$pkgdir/usr/share/$pkgname/$f"
  done
}
