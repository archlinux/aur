# Maintainer: TingPing tingping@tingping.se

pkgname=sysprof2-git
pkgver=3.20.0.r25.gb97425b
pkgrel=1
pkgdesc='CPU Profiler'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/chergert/sysprof2'
license=('GPL3')
options=('!libtool')
depends=('gtk3' 'polkit')
makedepends=('intltool' 'git' 'autoconf-archive')
install='sysprof2.install'
provides=('sysprof')
conflicts=('sysprof')
source=('git+https://git.gnome.org/browse/sysprof')
md5sums=('SKIP')
_gitname='sysprof'

pkgver() {
  cd "$_gitname"

  git describe --long | sed 's/^sysprof-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  ./autogen.sh --prefix=/usr --disable-debug
  make -s
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
