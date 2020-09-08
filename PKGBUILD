# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
_pkgname=local-by-flywheel
pkgver=5.7.4
pkgrel=4876
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('custom:proprietary')
makedepends=('rpmextract')
depends=(
  'numactl'
  'ncurses5-compat-libs'
  'libaio'
  'nettle6'
  'gtk3'
  'nss'
  'libjpeg-turbo'
  'libxss'
  'libxslt'
)
options=('emptydirs')
source=("https://cdn.localwp.com/releases-stable/$pkgver+$pkgrel/local-$pkgver-linux.rpm")
sha1sums=('8c10d86ce0a82cf34d2a3d2a13604b9839e6a558')

package() {
  rpmextract.sh ../local-$pkgver-linux.rpm
  mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
  mv $srcdir/opt $pkgdir/ 

  #Create symlink the executable to /usr/bin
  mkdir "$pkgdir"/usr/bin
  ln -s "$pkgdir"/opt/Local/local "$pkgdir"/usr/bin/$_pkgname

  #Setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/Local/chrome-sandbox

  cd $pkgdir/
}
