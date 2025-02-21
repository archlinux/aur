# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=florb-git
pkgver=r170.81a2051
pkgrel=2
pkgdesc="simple FLTK powered map viewer and GPX editor"
url="https://github.com/4fury-c3440d8/florb"
arch=(x86_64 i686)
license=(MIT)
depends=(fltk yaml-cpp libxpm curl tinyxml2 boost-libs gpsd libboost_system.so)
makedepends=(omake gendesk git boost translate-toolkit python-cwcwidth)
optdepends=(gpsbabel)
provides=(florb)
conflicts=(florb)
sha256sums=('SKIP')
source=("git+https://github.com/4fury-c3440d8/florb.git")

pkgver() {
  cd florb/src
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd florb/src
  gendesk -f -n --pkgname florb --exec florb --pkgdesc "$pkgdesc" --categories 'Utility;Maps'
  omake
  omake i18nupdate
  omake i18ncompile
}

package() {
  cd florb
  install -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd src
  omake PREFIX=${pkgdir}/usr install
  install -Dm644 florb.desktop "${pkgdir}/usr/share/applications/florb.desktop"
  install -D res/florb.svg "${pkgdir}/usr/share/pixmaps/florb.svg"
  install -D res/florb.png "${pkgdir}/usr/share/pixmaps/florb.png"

}
