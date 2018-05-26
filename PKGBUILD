pkgname=mruby-git
pkgrel=1
pkgver=1.0.0.r5216.g14c21793
pkgdesc='Lightweight Ruby'
arch=(i686 x86_64)
license=(MIT)
depends=(readline)
makedepends=(git bison ruby)
conflicts=(mruby)
replaces=(mruby)
provides=(mruby)
url='https://github.com/mruby/mruby'
options=(staticlibs)
source=(git+https://github.com/mruby/mruby)
sha1sums=('SKIP')

pkgver() {
  cd mruby
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd mruby
  make
}

check() {
  cd mruby
  make test
}

package() {
  cd mruby

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/mruby"
  cp build/host/bin/* "$pkgdir/usr/bin"
  cp build/host/lib/*.a "$pkgdir/usr/lib"
  cp -r include "$pkgdir/usr"

  cp MITL "$pkgdir/usr/share/licenses/mruby/LICENSE"
}
