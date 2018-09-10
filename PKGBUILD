# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=libdeltachat-core-git
pkgver=v0.20.0.r82.g1d11566a
pkgrel=1
pkgdesc="Library that provides the core functionality needed by the different user interfaces of deltachat."
arch=(x86_64)
url="https://github.com/deltachat/deltachat-core"
license=('GPL')
#depends=('libetpan' 'openssl' 'sqlite' 'libsasl' 'zlib' 'bzip2')
depends=('openssl' 'sqlite' 'libsasl' 'zlib' 'bzip2')
makedepends=('meson')
source=(git+https://github.com/deltachat/deltachat-core.git)
sha1sums=('SKIP')
options=('debug' '!strip')

pkgver() {
  cd deltachat-core
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
#meson --prefix /usr --buildtype=plain -Dsystem-etpan=true deltachat-core build
  meson --prefix /usr --buildtype=plain deltachat-core build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
