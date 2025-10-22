# Maintainer: Evangelos Athanasiadis <dyrer@yandex.com>
# Maintainer: Peter Kerschl <git@pmke.de>
pkgname=local-by-flywheel-bin
_pkgname=local-by-flywheel
pkgver=9.2.9
pkgrel=6887
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('custom:proprietary')
depends=(
  'libxcrypt-compat'
  'numactl'
  'ncurses5-compat-libs'
  'libaio'
  'gtk3'
  'nss'
  'libjpeg-turbo'
  'libxss'
  'libxslt'
)
options=('emptydirs')
source=("https://cdn.localwp.com/releases-stable/$pkgver+$pkgrel/local-$pkgver-linux.rpm")
sha1sums=('78869bb2d96500230de68ad24cc4340dbf21ae61')

package() {
  mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
  mv $srcdir/opt $pkgdir/

  #Create symlink the executable to /usr/bin
  mkdir "$pkgdir"/usr/bin
  ln -s /opt/Local/local "$pkgdir"/usr/bin/$_pkgname

  #Setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/Local/chrome-sandbox

  cd $pkgdir/
}
