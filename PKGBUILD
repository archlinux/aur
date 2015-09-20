# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=yrd
pkgver=0.4
pkgrel=1
pkgdesc='A cjdns config tool for humans and cyborgs'
url='https://github.com/kpcyrd/yrd'
license=('GPL3')
arch=('any')
depends=('python-argh' 'python-requests' 'cjdns' 'systemd')
makedepends=('python2-setuptools')
install=$pkgname.install
source=(
  "$url/archive/v$pkgver.tar.gz"
  "$pkgname.tmpfiles.conf"
)
sha512sums=(
  '681937852ecd08fcc587ee98dfa32f7e7e65c2c57250b14e4be4e60dab2d3acd376e6688be863d02d40f719b44b0f7ddc22fc9f9265211a3d41337d38531e47c'
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

  # Install the README.md to the shared docs folder
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
