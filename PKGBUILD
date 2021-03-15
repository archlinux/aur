# Maintainer: lmartinez-mirror
# Contributor: Pierre Dommerc <dommerc dot pierre at geemail dot com>
pkgname=bato-git
pkgver=0.1.3.r1.ge22c3b2
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("git+$url")
provides=('bato')
conflicts=('bato-bin')
depends=('libnotify')
makedepends=('git' 'cmake' 'rust')
md5sums=('SKIP')

pkgver()  {
  cd bato
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bato
  cargo build --release
}

package() {
  install -Dm 755 "bato/target/release/bato" -t "${pkgdir}/usr/bin"
}
