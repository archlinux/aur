# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mruby-git
pkgver=1.1.0.r154.ga1d4992
pkgrel=1
pkgdesc='Lightweight Ruby (preliminary release for internal team review)'
arch=(i686 x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
makedepends=(git bison ruby)
options=(staticlibs)
conflicts=(mruby)
replaces=(mruby)
provides=(mruby)
source=(git://github.com/mruby/mruby
        remove_termcap_static_lib.patch)
sha1sums=('SKIP'
          '3042fc7811afee7e88535dca43495a1a5486d6a5')

pkgver() {
  cd mruby
  git describe --long --tags | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd mruby
  patch -p1 < "$srcdir"/remove_termcap_static_lib.patch
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

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"
  cp build/host/bin/* "$pkgdir/usr/bin"
  cp build/host/lib/*.a "$pkgdir/usr/lib"
  cp -r include "$pkgdir/usr"
}

