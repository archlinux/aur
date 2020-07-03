# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
_pkgname=local-by-flywheel
pkgver=5.6.3
pkgrel=1
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
source=("https://cdn.localwp.com/releases-stable/5.6.3+4270/local-5.6.3-linux.rpm")
sha1sums=('449960d9efad86d5af4fb66d8c50baacececde79')

package() {
rpmextract.sh ../local-5.6.3-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 

#Create symlink the executable to /usr/bin
mkdir "$pkgdir"/usr/bin
ln -s "$pkgdir"/opt/Local/local "$pkgdir"/usr/bin/$_pkgname

#Setuid on chrome-sandbox
chmod u+s "$pkgdir"/opt/Local/chrome-sandbox

cd $pkgdir/
}
