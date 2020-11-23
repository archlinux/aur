# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dwmblocks-distrotube-git
pkgver=1.0.r13.af63299
pkgrel=1
pkgdesc="My own build of dwmblocks for use with my build of dwm."
arch=(x86_64 i686)
url="https://gitlab.com/dwt1/dwmblocks-distrotube.git"
license=('ISC')
groups=()
depends=(ttf-hack ttf-joypixels dwm-distrotube-git libxft-bgra-git)
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd dwmblocks-distrotube  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwmblocks-distrotube/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwmblocks-distrotube/README.md"
  chmod 0755 ${pkgdir}/opt/${pkgname}/scripts/*
}

