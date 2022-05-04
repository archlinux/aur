# Maintainer: ebiadsu <ebiadsu@posteo.de>

pkgname=ttf-advent-pro
pkgver=20131203
# fc-query -f '%{fontversion[0]}\n' ./AdventPro-*.ttf
pkgrel=3
pkgdesc="Google's Advent Pro font"
arch=(any)
license=(custom:OFL)
url='https://fonts.google.com/specimen/Advent+Pro'
# provides=(google-crosextra-carlito-fonts)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Advent%20Pro"
        "99-google-advent-pro.conf")
sha256sums=('ac4168295dc35d68bc19ba25592c67ad57d0051c0c4e1604bb4ab2becec3de5d'
            'c926c45dcc2f46a93ef9fb7f27143744d5bb7ae71c23b2584cd5fc09850b1a56')

package() {
  # install fonts
  install -Dt "$pkgdir/usr/share/fonts/${pkgname#ttf-}" -m644 *.ttf

  # install font config
  install -Dt "$pkgdir/etc/fonts/conf.avail" -m644 99-google-advent-pro.conf
  mkdir "$pkgdir/etc/fonts/conf.d"
  ln -srt "$pkgdir/etc/fonts/conf.d" "$pkgdir"/etc/fonts/conf.avail/99-google-advent-pro.conf

  # install license
  cp OFL.txt LICENSE
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
