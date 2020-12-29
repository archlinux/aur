# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>

pkgname=('flac-minimal-git')
pkgver=v1.3.3.ce6dd6b
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://xiph.org/flac/"
license=('BSD' 'GPL')
depends=('gcc-libs')
makedepends=('nasm')
#options=('!makeflags')
source=(git://github.com/xiph/flac.git)
sha1sums=('SKIP')
_gitname=flac

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --disable-doxygen-docs --enable-asm-optimizations --enable-sse --enable-altivec --enable-vsx --enable-avx --disable-valgrind-testing --disable-xmms-plugin --disable-ogg
  make
}

package_flac-minimal-git() {
  pkgdesc="Free Lossless Audio Codec (git version)"
#  options=('!docs')
  conflicts=('flac')
  provides=('flac' 'libFLAC.so' 'libFLAC++.so')

  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"
}
