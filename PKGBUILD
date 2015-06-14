# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-profiles
pkgver=0.3
pkgrel=2
pkgdesc='Collection of profiles for OGMRip'
arch=('any')
url='http://ogmrip.sourceforge.net/en/profiles.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13')
makedepends=(intltool)
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
locale.patch
)
build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../locale.patch
  ./configure --prefix=/usr --localedir=/usr/share/locale
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-profiles/README
}
md5sums=('7c8d43adf15e501f823a0bd059534ef0'
         '0c0f9e42a7ba68c2d225dc934b291596'
         'e67d042a508ef0c3fb6e1ca9ff2a2d20')
