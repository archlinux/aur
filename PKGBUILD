# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Casey McDonnell <c.j.mcdonn@gmail.com>

pkgbase=garlic
pkgname=('garlic' 'garlic-doc')
pkgver=1.6
pkgrel=6
arch=('i686' 'x86_64')
url="http://www.zucic.org/garlic/"
license=('GPL2')
source=(http://www.zucic.org/sources/$pkgbase-$pkgver/$pkgbase.1.gz
        http://www.zucic.org/sources/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz
        http://www.zucic.org/sources/$pkgbase-$pkgver/$pkgbase-$pkgver-doc.tar.gz
        $pkgbase.desktop)
md5sums=('5b91358ce8a48e12e6c1d3650aa6ebb4'
         '5fac1f13733d9700925a0cb9a407c651'
         '08ec479898102062250ebd60700e102c'
         'da42765ab5a03e78121c7e7729b609ca')

build() {
  cd "$pkgbase-$pkgver"
  export CCOPT=${CFLAGS}
  export LIBPATH="-L/usr/lib"
  make -e
}

package_garlic() {
  pkgdesc="Molecular visualization program"
  depends=('libx11')

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/{bin,share/{$pkgbase,applications,man/man1,pixmaps}}
  install -m755 "$pkgbase" "$pkgdir/usr/bin"
  install -m644 .garlicrc "$pkgdir/usr/share/$pkgbase/"
  install -m644 -t "$pkgdir/usr/share/$pkgbase" *.pdb
  install -m644 "$pkgbase.xpm" "$pkgdir/usr/share/pixmaps/"
  install -m644 "$srcdir/$pkgbase.1" "$pkgdir/usr/share/man/man1/"
  install -m644 "$srcdir/$pkgbase.desktop" "$pkgdir/usr/share/applications/"
}

package_garlic-doc() {
  pkgdesc="Documentation for garlic"
  depends=('garlic')
  arch=('any')

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  cp -r {favicon.ico,tolower.script,*.jpg,*.gif,*.html,*.png,*/} "$pkgdir/usr/share/doc/$pkgbase"
}