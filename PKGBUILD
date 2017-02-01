# Maintainer: Alex Schmidt <zyeryi@gmail.com>

_pkgname=xplugd
pkgname=xplugd-git
pkgver=v1.2.r9.gac258b7
pkgrel=1
pkgdesc="A UNIX daemon that executes a script on X input and RandR changes."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/xplugd"
license=('MIT')
depends=('libxi' 'libxrandr')
optdepends=('sh: example script')
makedepends=('git')
provides=('xplugd')
source=("$_pkgname::git+https://github.com/troglobit/xplugd.git")
md5sums=('SKIP') 

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

# vim:set ts=2 sw=2 et:
