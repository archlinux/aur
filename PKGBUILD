# Maintainer: Hinaloe <hina@hinaloe.net>
pkgname=octopass
pkgver=0.7.0
pkgrel=1
pkgdesc="Management linux user and authentication with team or collaborator on Github."
arch=('i686' 'x86_64')
url="http://linyo.ws/octopass"
license=('GPL3')
groups=()
depends=('glibc' 'curl' 'jansson')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/linyows/octopass/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
     "0001-fpath-buffer-extend.patch")
noextract=()
md5sums=('6d343956daeb01ec3a5f8dd7b340db60'
         'e28cd7b72556bf5cfbe3e505d43cb9d9')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 < ../0001-fpath-buffer-extend.patch
}

build() {
  cd "$pkgname-$pkgver"

  make CACHE=`pwd`/tmp/cache
}

package() {
  cd "$pkgname-$pkgver"

  install -D -d "$pkgdir/usr/bin"
  install -Dm0777 -d "$pkgdir/var/cache/octopass"

  make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr" install
  install -Dm644 octopass.conf.example "$pkgdir/etc/octopass.conf"
}

