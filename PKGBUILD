# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=jack-matchmaker
pkgver=0.10.0
pkgrel=3
pkgdesc='A command line tool to auto-connect JACK ports matching given patterns'
arch=(any)
url='https://github.com/SpotlightKid/jack-matchmaker'
license=(GPL2)
depends=(jack python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
backup=("etc/conf.d/$pkgname")
sha256sums=('70b8f53b0c75e8351ccdad4bf37bee8b544643604e0db1938ed749a4c0fa6ba6')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  # systemd service
  install -Dm 644 systemd/jack-matchmaker.conf "$pkgdir"/etc/conf.d/$pkgname
  install -Dm 644 systemd/jack-matchmaker.service -t "$pkgdir"/usr/lib/systemd/user
}
