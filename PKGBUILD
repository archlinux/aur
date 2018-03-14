# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.3.0
# real version is 1.3.0-3... I will repair that on 1.3.1
pkgrel=4
pkgdesc="An extensible proxy which prevents some ISP from detecting network traffic."
url="https://github.com/SnakeSocks/$pkgname"
license=("GPL2")
arch=("i686" "x86_64")
depends=("glibc>=2.14" "gcc-libs")
makedepends=("boost>=1.55" "go" "cmake>=3.5" "make")
conflicts=("$pkgname-bin")
replaces=("$pkgname-bin")
backup=("etc/$pkgname/conf/client.conf" "etc/$pkgname/conf/server.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-3.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://s.recn.pw/v$pkgver-3.tar.gz.sig")
validpgpkeys=("00D386A853D34998CC1D232A99B730DA4B48AF32")
sha256sums=("f3619be786a69775ba8885643f0b08e1a039169bd8ceb19b4e75967b0e0cebf6"
            "SKIP")

package() {
  export pkgdir
  cd "$pkgname-$pkgver-3"
  make default_modules
  make client # requires cmake and boost
  make server # requires go. comment it if you dont want it.
  make install
}

