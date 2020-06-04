# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=anita
pkgver=2.4
pkgrel=1
pkgdesc='A tool for automating NetBSD installs and building VM images.'
arch=('any')
url='http://www.gson.org/netbsd/anita/'
license=('custom')
depends=('cdrtools'
         'python-pexpect')
makedepends=('python-setuptools')
source=("http://www.gson.org/netbsd/anita/download/anita-${pkgver}.tar.gz")
sha256sums=('5dcd8e3dbd95345eb2692ff66bd1b8f660060c8f8187aff720bea0dac24fefbc')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  install -dm775 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # The NetBSD man page isn't in the same location that Arch wants.
  mv $pkgdir/usr/man $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
