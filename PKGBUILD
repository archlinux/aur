# Maintainer: sng <sng at hellug dot gr>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio
pkgver=0.9.2.4
pkgrel=1
pkgdesc="Internet radio player for the command line"
arch=('any')
url="https://github.com/coderholic/pyradio"
license=('MIT')
depends=('python-dnspython' 'python-requests' 'python-psutil' 'python-netifaces' 'python-rich')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend')
makedepends=('python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coderholic/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a052ecd897b0a3df82f026c05dd58c571ee683f64919fbf5c86b3a79c5203979')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/distro = None/distro = Arch Linux (AUR)/' $pkgname/config
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.{html,md} build.{html,md} -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 pyradio{,_rb,_server}.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 devel/pyradio.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 devel/pyradio.png -t "$pkgdir/usr/share/icons"

  PIP_CONFIG_FILE=/dev/null python -m pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps .

}

