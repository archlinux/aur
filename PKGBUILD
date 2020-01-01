# Maintainer: Mateusz Janczuk <devqore@gmail.com>
pkgname=myrdp
pkgver=2018.2.0
pkgrel=3
pkgdesc="RDP manager using freerdp. Similar to Remmina, mRemoteNG, RDCMan."
arch=('any')
url="https://github.com/devqore/myrdp"
license=('GPL')
depends=('freerdp' 'python2' 'python2-alembic' 'python2-pyqt4'
         'python2-pycryptodomex' 'python2-sip-pyqt4')
makedepends=('git')
source=("myrdp.sh"
        "myrdp.desktop"
        "$pkgname::git+https://github.com/devqore/myrdp#tag=$pkgver")
sha256sums=('7ca211c23f2600d4406058f32cc22b8a42f0c9874b366496e3d0bda0c05ea4b5'
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
