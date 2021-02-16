# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Allan McRae (allan <at> archlinux <dot> org)
# Contributor: Alexander 'bas' Brovikov (bas <at> it-core <dot> org)

pkgname=wine-gecko-bin
pkgver=2.47.2
pkgrel=2
pkgdesc="Wine's built-in replacement for Microsoft's Internet Explorer"
arch=('x86_64')
url="https://wiki.winehq.org/Gecko"
license=('MPL')
depends=('wine')
makedepends=('mingw-w64-binutils')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine-gecko-$pkgver-x86.tar.xz)
source_x86_64=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine-gecko-$pkgver-x86_64.tar.xz)
md5sums=('e03bda74aa387f5f6f439c0dadfda9e9')
md5sums_x86_64=('2fc64999050579629bcbcd344e397bfa')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/gecko/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver-x86{,_64} "$pkgdir"/usr/share/wine/gecko/

  local _geckodir="$pkgdir"/usr/share/wine/gecko/${pkgname/-bin/}-$pkgver
  i686-w64-mingw32-strip --strip-unneeded \
    $(find "$_geckodir"-x86/ -iname "*.dll" -or -iname "*.exe")
  x86_64-w64-mingw32-strip --strip-unneeded \
    $(find "$_geckodir"-x86_64/ -iname "*.dll" -or -iname "*.exe")
}
