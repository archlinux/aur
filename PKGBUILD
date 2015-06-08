# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: nikitines <nikitin.evgeni@gmail.com>
# Contributor: Noneus <N_O_N_E_U_S at noneus.de>

pkgname=furiusisomount
pkgver=0.11.3.1
pkgrel=1
pkgdesc="A PyGTK interface for managing ISO/IMG/BIN/MDF/NRG image files"
arch=('any')
url="https://launchpad.net/furiusisomount"
license=('GPL3')
depends=('desktop-file-utils' 'fuseiso' 'pygtk')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/python/$pkgver/+download/${pkgname}_$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('811cc5042c1d7ed69e4c0af347c94848'
         'ee0a8d9575a608c127ccb362f88508d4')

package() {
  cd "$srcdir/${pkgname}_$pkgver"

  # python2
  find src -name '*.py' -exec sed -i '1s/python/&2/' '{}' \;
  sed -i "s/python/&2/; 2a\cd /usr/share/$pkgname" $pkgname

  # dist
  install -dm755 "$pkgdir"/usr/share/$pkgname/{pix,res,src}
  install -m644 pix/* "$pkgdir/usr/share/$pkgname/pix/"
  install -m644 res/main_window.glade "$pkgdir/usr/share/$pkgname/res/"
  install -m644 src/* "$pkgdir/usr/share/$pkgname/src/"

  # launchers
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # locales
  for _mo in $(find locale -name '*.mo'); do
    install -Dm644 $_mo "$pkgdir/usr/share/$_mo"
  done
}

# vim:set ts=2 sw=2 et:
