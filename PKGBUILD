# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=st-distrotube
pkgver=0.8.2
pkgrel=1
pkgdesc="A heavily-patched and customized build of st (the Suckless simple terminal) from DistroTube."
arch=(x86_64 i686)
url="https://gitlab.com/dwt1/st-distrotube.git"
license=('MIT')
groups=()
depends=()
makedepends=(make)
checkdepends=()
optdepends=(nerd-fonts-complete ttf-symbola)
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
  mkdir -p "${pkgname}" || return 1
  cd "${pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${pkgname}"  
  mkdir -p $pkgdir/opt/st-distrotube || return 1
  cp -rf * $pkgdir/opt/st-distrotube || return 1
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

