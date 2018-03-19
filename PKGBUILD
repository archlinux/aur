pkgname=pacmanity
pkgver=3.0
pkgrel=1
pkgdesc="Keeps a list of installed packages in a Gist at your GitHub account"
url="https://github.com/DerekTBrown/$pkgname"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('git')
depends=('pacman>=5.0' 'gist>=4.5.0')
source=("$pkgname::git+https://github.com/DerekTBrown/$pkgname.git")
md5sums=('SKIP')

package() {

  # Install and save file
  mkdir -p $pkgdir/etc/
  touch $pkgdir/etc/pacmanity

  # Install script
  mkdir -p $pkgdir/usr/lib/pacmanity
  cp $srcdir/pacmanity/src/pacmanity.sh $pkgdir/usr/lib/pacmanity/pacmanity.sh
  chmod +x $pkgdir/usr/lib/pacmanity/pacmanity.sh

  # Install Hook
  mkdir -p $pkgdir/usr/share/libalpm/hooks
  cp $srcdir/pacmanity/src/pacmanity.hook $pkgdir/usr/share/libalpm/hooks/zzz-pacmanity.hook

  source $pkgdir/usr/lib/pacmanity/pacmanity.sh
  pacmanity_install

}
