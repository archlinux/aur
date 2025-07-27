# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tdns-git
_pkgname=tdns
pkgver=v0.4.0.r0.472d7df
pkgrel=1

pkgdesc="A powerful, lightweight CLI to manage Technitium DNS server via HTTP API endpoint"
arch=('x86_64')
url='https://github.com/mbevc1/tdns'
license=('MPL-2.0')
makedepends=('make' 'coreutils' 'go' 'upx')
provides=('tdns')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
        git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  # Building a second time will fail as for some reason the makefile doesn't run the $(BIN) section after cleaning.
  # Building a third time and subsequently ever other time however will run it correctly :shrug:.
  make build
}

package() {
  cd $srcdir/$_pkgname

  install -Dm 755 tdns -t $pkgdir/usr/bin/
  install -Dm 644 LICENSE -T $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
