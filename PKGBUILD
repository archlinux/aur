# Maintainer: Hamza Mughal <hamza@prodesquare.com>
pkgname=st-prodesquare-git
pkgver=0.8.3.r5.221df5b
pkgrel=1
epoch=
pkgdesc="Hamza Mughal's patch of ST with Xresources support, transparency, scrolling etc"
arch=(x86_64 i686)
url="https://github.com/ProDeSquare/st.git"
license=('MIT')
groups=()
depends=(ttf-jetbrains-mono ttf-joypixels)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "0.8.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd st
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
