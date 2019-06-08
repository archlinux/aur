# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=anita
pkgver=1.48
pkgrel=1
pkgdesc='A tool for automating NetBSD installs and building VM images.'
arch=('any')
url='http://www.gson.org/netbsd/anita/'
license=('custom')
depends=('python2-pexpect')
makedepends=('python2-setuptools')
source=("http://www.gson.org/netbsd/anita/download/anita-${pkgver}.tar.gz")
sha256sums=('7b6b41c6ba251547ebc9bc8b711a2465760bb176a7c925f1ce6988759e92782f')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  install -dm775 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # The NetBSD man page isn't in the same location that Arch wants.
  mv $pkgdir/usr/man $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
