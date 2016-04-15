# Maintainer: TingPing tingping@tingping.se

pkgname=sysprof2-git
pkgver=3.19.90.r544.g88d3ae3
pkgrel=1
pkgdesc='CPU Profiler'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/chergert/sysprof2'
license=('GPL3')
options=('!libtool')
depends=('gtk3' 'polkit')
makedepends=('intltool' 'git' 'autoconf-archive')
install='sysprof2.install'
provides=('sysprof2')
conflicts=('sysprof2')
source=('git+https://github.com/chergert/sysprof2.git')
md5sums=('SKIP')
_gitname='sysprof2'

pkgver() {
  cd "$_gitname"

  # TODO: Waiting for a git tag
  _ver='3.19.90'
  _rev=`git rev-list --count HEAD`
  _hash=`git describe --always`
  echo "$_ver.r$_rev.g$_hash"
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
