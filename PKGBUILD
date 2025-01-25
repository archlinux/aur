pkgname=psp-pthread-embedded
pkgver=1.0
pkgrel=1
pkgdesc="POSIX Threads for embedded systems (psp)"
arch=('any')
url="https://github.com/pspdev/pthread-embedded"
license=('LGPL')
depends=('psp-newlib')
makedepends=('psp-gcc-base' 'git')
options=('staticlibs' '!buildflags' '!strip')
source=("git+https://github.com/pspdev/pthread-embedded.git#branch=platform_agnostic")
md5sums=('SKIP')

build() {
  cd "$srcdir"/pthread-embedded
  make -C platform/psp TARGET_LIB=libpthread.a
}

package() {
  cd "$srcdir"/pthread-embedded
  make -C platform/psp DESTDIR="$pkgdir"/usr/psp TARGET_LIB=libpthread.a install
}
