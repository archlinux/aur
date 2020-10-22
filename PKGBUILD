# Maintainer: Viktor Semykin <thesame.ml@gmail.com>
#

pkgname=mongodb-3.6-bin
pkgver=3.6.20
pkgrel=1
pkgdesc="Document-oriented database server"
arch=(x86_64)
url="https://www.mongodb.com/"
license=('custom:SSPL')
depends=()
provides=("mongodb=$pkgver" "mongodb-tools=$pkgver")
conflicts=("mongodb" "mongodb-bin" "mongodb-tools" "mongodb-tools-bin")
replaces=("mongodb" "mongodb-tools")
backup=("etc/mongodb.conf")
source=(
  "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.20.tgz"
  "mongodb.conf"
  "mongodb-3.6.service"
  "mongodb.sysusers"
  "mongodb.tmpfiles"
  )
md5sums=(
  "d99542d71f2ba71ae3ebe1a066856d11"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  )

package() {
	cd "$srcdir/mongodb-linux-$arch-$pkgver"
  install -d "$pkgdir/usr"
  cp -r bin "$pkgdir/usr"
  unlink "$pkgdir/usr/bin/install_compass"
  install -Dm644 "$srcdir/mongodb-3.6.service" "$pkgdir/usr/lib/systemd/system/mongodb-3.6.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "LICENSE-Community.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
