# Maintainer: Michael Straube <straubem gmx de>

pkgname=froggix
pkgver=0.1
pkgrel=4
pkgdesc="A clone of the classic arcade game Frogger"
arch=('any')
license=('GPL3' 'custom')
url="https://sourceforge.net/projects/froggix"
depends=('python2-pygame')
source=("https://downloads.sourceforge.net/froggix/Froggix.tar.gz"
        "highscore-path.patch"
        "froggix.sh")
sha1sums=('1e8bd04bd35c294f6108b302601243059a4fa59a'
          'ba835e79d2e0e0f63c2f926f86302f6bf4796384'
          '323a47ad618dbf296a40256b57c0be9c2eb49bad')

prepare() {
  cd $pkgname
  patch -p1 < ../highscore-path.patch
}

package() {
  cd $pkgname
  install -d -m 755 "$pkgdir"/usr/share/froggix/data
  install -m 644 froggix.py README "$pkgdir"/usr/share/froggix
  install -m 644 data/* "$pkgdir"/usr/share/froggix/data
  install -D -m 755 ../froggix.sh "$pkgdir"/usr/bin/froggix
  install -D -m 644 Credits_and_Licenses "$pkgdir"/usr/share/licenses/$pkgname/Credits_and_Licenses
}
