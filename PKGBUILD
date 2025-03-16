# Maintainer: <vcalv>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: breakdown <breakdown(at)archlinux(dot)us>

pkgname=plowshare
pkgver=2.1.7
_jsver=115
pkgrel=9
pkgdesc="CLI downloader and uploader for Rapidshare, Mediafire and other file sharing websites"
arch=(any)
url="https://github.com/mcrapet/plowshare"
license=(GPL3)
depends=(
  bash
  curl
  "js$_jsver"
  recode
  git
)
optdepends=(
  'bash-completion: enable bash auto completion'
  'imagemagick: X11 picture viewer for captchas'
  'sxiv: X11 picture viewer for captchas'
  'feh: X11 picture viewer for captchas'
  'qiv: X11 picture viewer for captchas'
  'fbida: framebuffer picture viewer for captchas'
  'libcaca: framebuffer ascii picture viewer for captchas'
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('7fe91d3756c55ffc1daf9275bfd2413f2644accd8fa69f2b1064696e1435f9b8be9515907c8249ffde85436dc6966f1d42bad94ccfbde93ae584dcc0d642c215')
b2sums=('bfec7fba200d783fcba5051738f98f7cd862eede1661b4d72062bd111b394800406443e52ecf2f0b771b90a9834a87fae01a6055828e8a12446126c593daa01c')

prepare() {
  # rename js executable to reflect js package
  sed -e 's|-js}|-js'$_jsver'}|' -i $pkgname-$pkgver/src/core.sh
  # force release version
  export PLOWSHARE_FORCE_VERSION="$pkgver"
}

package() {
	PLOWSHARE_FORCE_VERSION="$pkgver (js-$_jsver)" make install DESTDIR="$pkgdir/" PREFIX=/usr -C $pkgname-$pkgver
}
