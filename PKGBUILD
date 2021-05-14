# Maintainer: Ashin Antony <ashinant15@gmail.com>

pkgname=surf-ashin-git
pkgver=2.1
pkgrel=1
pkgdesc='A suckless browser customized with bookmarkings and stylesheets.'
arch=(x86_64 i686)
url='https://github.com/ashincoder/surf-ashin.git'
license=('MIT')
depends=(webkit2gtk xorg-xprop dmenu)
optdepends=('ca-certificates: SSL verification'
            'curl: default download handler'
            'dmenu-ashin-git: more beautiful and functional')
makedepends=(git )
checkdepends=()
provides=(surf)
conflicts=(surf)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd surf-ashin
  printf "2.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd surf-ashin
  make 
}

package() {
  cd surf-ashin  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

