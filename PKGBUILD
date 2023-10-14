# Maintainer: PatzminiHD <7.0@gmx.at>
pkgname=bbprog-git
_pkgname=${pkgname%-git}
pkgver=2.1.0
pkgrel=1
pkgdesc="Backup a list of entries using rsync or borg. Supports parallelization of backups"
arch=('x86_64')
url="https://github.com/PatzminiHD/bbprog"
license=('GPL3')
depends=(
    "icu"
    "zlib"
    "rsync"
    "borg"
)
makedepends=(
    "git"
    "dotnet-host"
    "dotnet-sdk-6.0"
)
options=("staticlibs" "!strip")
source=("git+${url}.git")
sha512sums=("SKIP")

build() {
  cd "bbprog"

  MSBUILDDISABLENODEREUSE=1 dotnet publish --self-contained --runtime linux-x64 --output ../$pkgname.tmp
}

package() {
  install -d $pkgdir/opt/
  install -d $pkgdir/usr/bin/

  cp -r $pkgname.tmp "$pkgdir/opt/$pkgname/"
  rm "$pkgdir/opt/$pkgname/bbprog.pdb"
  ln -s "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
