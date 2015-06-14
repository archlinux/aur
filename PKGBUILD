# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gimp-paint-studio
pkgver=2.0
_pkgver='2_0%20final'
_pkgname='GPS%20'
pkgrel=1
pkgdesc="Collection of brushes and accompanying tool presets intended to speed up repetitive tasks by avoiding the need to manually reset tool options after each change"
arch=('any')
url="http://code.google.com/p/gps-gimp-paint-studio"
license=('custom:Artistic License' 'GPL' 'CCPL')
depends=('gimp')
source=("$pkgname-$pkgver.zip"::"http://gps-gimp-paint-studio.googlecode.com/files/${_pkgname}${_pkgver}.zip"
LICENSE
http://gps-gimp-paint-studio.googlecode.com/files/sessionrc
)
install='gps.install'
options=(!strip)

package() {
  cd "$srcdir"
  _gimpdir=/usr/share/gimp/2.0
  install -dm755 "$pkgdir"/$_gimpdir

  tar -c -h ./ \
    --exclude $pkgname-$pkgver.zip \
    --exclude LICENSE \
    | tar -x -C "$pkgdir"/$_gimpdir

  install -Dm644 sessionrc "$pkgdir"/usr/share/$pkgname/sessionrc
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # fix permissions
  find "$pkgdir" -type f -exec chmod 0644 '{}' ';'
}
md5sums=('6ce9b9ec4fea8c2f4f78837f53cf9096'
         '6aa6d7145a6041193bcca0f915152ef0'
         '72e1b69685fdc6c3f8053e90c392ff93')
