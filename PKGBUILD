# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=yrd
pkgver=0.4.2.0
pkgrel=1
pkgdesc='A cjdns config tool for humans and cyborgs'
url='https://github.com/kpcyrd/yrd'
license=('GPL3')
arch=('any')
depends=('python-argh' 'python-requests' 'cjdns' 'systemd')
makedepends=('python-setuptools')
install=$pkgname.install
source=(
  "$url/archive/v$pkgver.tar.gz"
  "$pkgname.tmpfiles.conf"
)
sha512sums=(
  'f779459f72607a044c50168ab46bfc597083f2cfc41d4b75ce63ac8ace92f60e6032c4ed1b7994cc565e63c184556737bb0c9a0a592fdb3c5b2e7f725d24c3d8'
  '191fdf5687886357c01b72b2b9037045ca24d0ee888dc2bf6b2748a769eeb9a481eb01a9807f8f32b783d0970229f18d1264e937c2dd44b282ac764c49450cca'
)

package() {
  # Install the tmpfiles.d config
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # Install using setuptools
  cd $pkgname-$pkgver
  python setup.py install --prefix="$pkgdir/usr"

  # Install the systemd service
  install -Dm644 init/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # Install the man page
  install -Dm644 doc/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  # Install the README.md to the shared docs folder
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
