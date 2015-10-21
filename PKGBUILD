# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=yrd
pkgver=0.4.1
pkgrel=2
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
  'e4309fd3d8c574dd3a97ab65aeb6e5b6a37107fe384ad93ebaa7ee5e9d6f9126d25f402ef931c57da9279ec9b4ac6f2702708706e6dbc23a0329632df2b3fac3'
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
