# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: blu256 <mfilippos@yandex.ru>
# Contributer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=ude
pkgver=0.2.11a
pkgrel=1
pkgdesc="The ultimate window manager for UDE"
arch=('x86_64')
license=('GPL')
depends=('libjpeg' 'libxmu' 'libxpm' 'bash')
makedepends=('gendesk')
url="http://udeproject.sourceforge.net/index.shtml"
source=(http://downloads.sourceforge.net/udeproject/uwm-${pkgver/_/}.tar.gz)
sha256sums=('dd056857c98b75c9203861917db33bcaf87ba074bdd204cf732ce4cb777cb408')

build() {
  cd "$srcdir"
  gendesk -n --pkgname=uwm --name=UWM --pkgdesc="$pkgdesc"

  cd "uwm-${pkgver/_/}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/uwm-${pkgver/_/}"

  make prefix="$pkgdir/usr" install
  install -Dm644 "$srcdir/uwm.desktop" "$pkgdir/usr/share/xsessions/uwm.desktop"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}
