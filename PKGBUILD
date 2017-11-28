pkgname=pacmanity
pkgver=0.1
pkgrel=1
pkgdesc="Saves the list of packages installed via pacman and yaourt to your Github gist"
url="https://github.com/DerekTBrown/pacmanity"
arch=('x86_64' 'i686')
license=('GPL')
depends=('pacman>=5.0' 'gist-git>=4.5.0')
makedepends=('git')
source=("$pkgname::git+https://github.com/DerekTBrown/pacmanity.git")
md5sums=('SKIP')

package() {

  # Install and save file
  mkdir -p $pkgdir/etc/
  touch $pkgdir/etc/pacmanity
  touch $pkgdir/etc/pacmanity_aur
  # Install script
  mkdir -p $pkgdir/usr/lib/pacmanity
  cp $srcdir/pacmanity.sh $pkgdir/usr/lib/pacmanity/pacmanity.sh
  chmod +x $pkgdir/usr/lib/pacmanity/pacmanity.sh
  cp $srcdir/pacmanity_aur.sh $pkgdir/usr/lib/pacmanity/pacmanity_aur.sh
  chmod +x $pkgdir/usr/lib/pacmanity/pacmanity_aur.sh

  # Install Hook
  mkdir -p $pkgdir/usr/share/libalpm/hooks
  cp $srcdir/pacmanity.hook $pkgdir/usr/share/libalpm/hooks/pacmanity.hook
  cp $srcdir/pacmanity_aur.hook $pkgdir/usr/share/libalpm/hooks/pacmanity_aur.hook

  source $pkgdir/usr/lib/pacmanity/pacmanity.sh; pacmanity_install;
  source $pkgdir/usr/lib/pacmanity/pacmanity_aur.sh; pacmanity_aur_install;

}
