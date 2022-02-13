# Maintainer: sng <sng at hellug dot gr>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=pyradio
pkgver=0.8.9.14
pkgrel=1
pkgdesc="Internet radio player for the command line"
arch=('any')
url="https://github.com/coderholic/pyradio"
license=('MIT')
depends=('python-dnspython' 'python-requests' 'python-psutil')
optdepends=('mplayer: as backend' 'mpv: as backend' 'vlc: as backend')
makedepends=('python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coderholic/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('76e06934926a1acfd7bba3735d8e0b387d7985dd38a398376877b6fd7da71940')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/distro = None/distro = Arch Linux (AUR)/' $pkgname/config
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.{html,md} build.{html,md} -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 pyradio{,_rb}.1 -t "$pkgdir/usr/share/man/man1"

  PIP_CONFIG_FILE=/dev/null pip install --no-warn-script-location --isolated --root="$pkgdir" --ignore-installed --no-deps .

}

