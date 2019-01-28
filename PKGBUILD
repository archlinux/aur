#Maintainer: Ali Molaei ali.molaei@protonmail.com

pkgname="mongodb-bin"
pkgver="4.0.5"
pkgrel="1"
pkgdesc="Scalable and flexible document database"
arch=("x86_64")
url="https://www.mongodb.com/"
license=("SSPLv1")
provides=("mongodb=$pkgver" "mongodb-tools=$pkgver")
conflicts=("mongodb" "mongodb-tools")
source=(
    "https://fastdl.mongodb.org/linux/mongodb-linux-$arch-$pkgver.tgz"
    "mongodb.service"
    "mongodb.conf"
    "mongodb.sysusers"
    "mongodb.tmpfiles"
    )

md5sums=('43b3babdf53e7cbca11bae297aa80ca2'
	 '96ab4517b48974ce0e566d9746a75a4f'
         '4839fe1d638187ca3226e8267b947318'
         'ff773b723f7bf217c2a8176e3b143498'
         'c599936e8858aeba31dc06cc3ff88612')

backup=("etc/mongodb.conf")

package() {
  mkdir -p "$pkgdir/usr"
  cp -r "$srcdir/mongodb-linux-$arch-$pkgver/bin" "$pkgdir/usr/"
  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
}

