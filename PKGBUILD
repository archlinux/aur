#Maintainer : <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=hex-a-hop
pkgname=${_pkgname}-git
pkgver=r99.f0ba80d
pkgrel=2
pkgdesc="A puzzle game based on hexagonal tiles"
arch=('i686' 'x86_64')
url="https://hexahop.sourceforge.net"
license=('GPL2')
depends=('sdl' 'sdl_mixer' 'sdl_ttf' 'sdl_pango')
makedepends=('git')
source=(
  "${_pkgname}::git+https://git.code.sf.net/p/hexahop/code"
  "hex-a-hop.desktop"
  "hex-a-hop.png"
)
sha256sums=('SKIP'
            '029513f5caf7ea6fbf3f851afdf04248902a9695a854d428cc082c657db6f952'
            '28bef43a4ab6947fd2ece7d4dda44fe0ce4d8d69ec18fb4896bdacfc24b8b5dc')
conflicts=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
}


build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  cd ..
  install -Dm644 hex-a-hop.desktop "${pkgdir}/usr/share/applications/hex-a-hop.desktop"
  install -Dm644 hex-a-hop.png "${pkgdir}/usr/share/icons/hex-a-hop.png"
}
