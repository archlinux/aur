# Contributor: foutrelis
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: slubman <slubman@slubman.net>

pkgname=tk_theme
_pkgname=Tk_Theme
pkgver=23
pkgrel=1
pkgdesc="A library to allow Tkabber docking in the system tray."
arch=('x86_64')
depends=('tk' 'libxpm' 'libxmu')
license=('custom')
source=("http://tkabber.jabber.ru/files/other/${_pkgname}-$pkgver.tgz")
sha256sums=('0c03694dc89db26d3596a24c8f918bf4d50d7f2b37cf9e1e5c60d2c40ddcdaf0')
url="http://tkabber.jabber.ru"

prepare() {
  cd ${_pkgname}-$pkgver
  sed -i 's|ifneeded Tk_Theme 20|ifneeded Tk_Theme 23|' pkgIndex.tcl
}

build() {
  cd ${_pkgname}-$pkgver
  tclsh configure
  make
}

package() {
  cd ${_pkgname}-$pkgver
  install -Dm644 theme.so "$pkgdir"/usr/lib/tktheme/theme.so
  install -Dm644 pkgIndex.tcl "$pkgdir"/usr/lib/tktheme/
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}
