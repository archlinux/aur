# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=xawtv
pkgver=3.107
pkgrel=1
pkgdesc="A simple Xaw-based TV program which uses the bttv driver or video4linux"
arch=('x86_64')
url="https://git.linuxtv.org/xawtv3.git"
license=('GPL')
depends=('aalib' 'v4l-utils' 'libxv' 'libxrandr' 'libgl' 'libdv' 'zvbi' 'libxinerama' 'lirc' 'libxft' 'libxaw' 'xorg-fonts-misc' 'libxxf86vm')
makedepends=('mesa' 'git' 'xorgproto')
_commit=8e3feea862db68d3ca0886f46cd99fab45d2db7c
source=("git+https://git.linuxtv.org/cgit.cgi/xawtv3.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd xawtv3
  git describe --tags | sed 's/^xawtv-//;s/-/+/g'
}

prepare() {
  cd xawtv3
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/xawtv3"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --disable-motif --disable-quicktime
  make
}

package() {
  cd "${srcdir}/xawtv3"
  make DESTDIR="${pkgdir}" install
}
