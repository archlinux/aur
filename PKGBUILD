# Maintainer: Brian Cole <archlinux@brianecole.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=anita
pkgver=2.5
pkgrel=2
pkgdesc='A tool for automating NetBSD installs and building VM images.'
arch=('any')
url='http://www.gson.org/netbsd/anita/'
license=('ISC')
depends=('cdrtools'
         'python-pexpect')
makedepends=('python-setuptools')
source=("http://www.gson.org/netbsd/anita/download/anita-${pkgver}.tar.gz")
sha256sums=('00f05520891435b19218311df8475a804e12190c80fb9c878fdaa5ae56409761')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  install -dm775 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # The NetBSD man page isn't in the same location that Arch wants.
  mv $pkgdir/usr/man $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
