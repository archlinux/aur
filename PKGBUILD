# Maintainer: Carlos Fagiani Junior <fagianijunior@gmail.com>
pkgname=local-by-flywheel-bin
_pkgname=local-by-flywheel
pkgver=5.9.6
pkgrel=5194
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
  'rpmextract'
)
options=('emptydirs')
source=("https://cdn.localwp.com/releases-stable/$pkgver+$pkgrel/local-$pkgver-linux.rpm")
sha1sums=('afc2a97db960fefa06f18b0d991d0e088e8f6498')

package() {
  rpmextract.sh ../local-$pkgver-linux.rpm
  mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
  mv $srcdir/opt $pkgdir/ 

  #Create symlink the executable to /usr/bin
  mkdir "$pkgdir"/usr/bin
  ln -s /opt/Local/local "$pkgdir"/usr/bin/$_pkgname

  #Setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/Local/chrome-sandbox

  cd $pkgdir/
}
