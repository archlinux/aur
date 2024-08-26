# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: dreieck
# Contributor: Mikael Blomstrand <gmail: chawlindel>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=adbfs-rootless-git
pkgver=r112.fd56381
pkgrel=1
pkgdesc='fuse filesystem over adb tool for android devices, no device root required'
arch=($CARCH)
url='https://github.com/spion/adbfs-rootless'
license=(BSD-3-Clause)
depends=(fuse android-tools)
makedepends=(git)
conflicts=(${pkgname%-git} ${pkgname%%-*})
provides=(${pkgname%-git} ${pkgname%%-*})
source=(git+$url
        adbfs-devspecific.sh)
sha256sums=('SKIP'
            'ca5f6d3c41bcff2f4476169a9933f67bf43cd7263e8182a294e509b0b61ba3dd')

pkgver() {
  cd ${pkgname%-git}
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm755 ../adbfs-devspecific.sh adbfs -t "$pkgdir/usr/bin/"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
