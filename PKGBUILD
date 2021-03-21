# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=getver
pkgver=0.6.1
pkgrel=1
pkgdesc='Guess the latest upstream version of a given PKGBUILD'
arch=(x86_64)
url='https://github.com/xyproto/getver'
license=(MIT)
makedepends=(git go)
depends=(pacman-contrib setconf)
source=("git+https://github.com/xyproto/getver.git#commit=23b14cfe5ba12eb902c9191ede04ad18eba9dd94") # tag: v0.6.1
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd $pkgname
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m755 "scripts/bumpver.sh" "$pkgdir/usr/bin/bumpver"
  install -m755 "scripts/bumprel.sh" "$pkgdir/usr/bin/bumprel"
  install -m755 "scripts/vup.sh" "$pkgdir/usr/bin/vup"
  install -m755 "scripts/geturlver.sh" "$pkgdir/usr/bin/geturlver"
  install -m755 "scripts/allversions.sh" "$pkgdir/usr/bin/allversions"
}
