# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gimp-paint-studio
pkgver=2.0
_pkgver='2_0'
_pkgname='GPS%20'
pkgrel=2
pkgdesc="Collection of brushes and accompanying tool presets intended to speed up repetitive tasks by avoiding the need to manually reset tool options after each change"
arch=('any')
url="http://code.google.com/p/gps-gimp-paint-studio"
license=('custom:Artistic License' 'GPL' 'CCPL')
depends=('gimp')
source=(
# "$pkgname-$pkgver.zip"::"http://gps-gimp-paint-studio.googlecode.com/files/${_pkgname}${_pkgver}.zip"
https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gps-gimp-paint-studio/GPS_${_pkgver}.tar.gz
LICENSE
# http://gps-gimp-paint-studio.googlecode.com/files/sessionrc
https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gps-gimp-paint-studio/sessionrc
)
sha512sums=('d8fbd7059e18e206c144fb1c44a80293f7992012f7c14f1eb5522dc8a73997da997276e0132ca36458d5816b06d325c15aa29b7165e9fc9503ff1f991329e6fc'
            'da316ba1faa5bf19b8f90ebecbee610f51f9617e185984917e19d482304ae2d4d2a27b9ae203f2e3b7f7f38b40a808fd4796d7aa71d0f8211aa6ba227f4e2984'
            'de34bcadd84c94ae15866f6ab87b806e78398a1bd5d4f6bc6fa095e7eb1ca41d49acabbef597688dbc72ce596ef05770ada88a7982bc198af7c7d28b29b57d28')
install='gps.install'
options=(!strip)
noextract=(GPS_${_pkgver}.tar.gz)

prepare() {
  cd $srcdir
  install -dm755 $pkgname
  tar -xzf GPS_${_pkgver}.tar.gz -C $pkgname \
    --exclude Readme.txt \
    --exclude License_gpl-2.0.txt \
    --exclude 'License for Contents'
}
package() {
  cd "$srcdir"
  _gimpdir=/usr/share/gimp/2.0
  install -dm755 "$pkgdir"/$_gimpdir


  install -Dm644 sessionrc "$pkgdir"/usr/share/$pkgname/sessionrc
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mv "$srcdir"/$pkgname/* "$pkgdir"/$_gimpdir/
  # fix permissions
  find "$pkgdir" -type f -exec chmod 0644 '{}' ';'
  find "$pkgdir" -type d -exec chmod 0755 '{}' ';'
}
