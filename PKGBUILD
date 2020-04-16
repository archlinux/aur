# Maintainer & Contributor: Guillermo Blanco <guillermoechegoyenblanco@gmail.com>
# Upstream URL: https://github.com/m0n0l0c0/mutant
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/m0n0l0c0/mutant

pkgname=mutant
# _pkgname=Mutant
pkgrel=1
pkgver=0.2.1
pkgdesc='Linux Spotlight Productivity launcher, but more customizable.'
url='https://github.com/m0n0l0c0/mutant'
provides=('mutant')
arch=('x86_64')
license=('MIT')
depends=('nodejs-lts-erbium' 'pkg-config' 'sqlite' 'npm' 'gtk3' 'librsvg')
makedepends=('git')
backup=()
install=''
source=('git://github.com/m0n0l0c0/mutant.git#branch=develop')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./install/install.sh
  npm run postinstall
  ./install/mkDist.sh $srcdir/opt
}

package() {
  # Create necessary dirs
  install -dm755 "$pkgdir"/{opt,usr/bin}
  cp -a "$srcdir/opt/$pkgname" "$pkgdir/opt/$pkgname"
  # Set permissions on pkgdir
  chmod 755 "$pkgdir/opt/$pkgname/$pkgname"
  install -Dm644 "$srcdir/opt/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  for res in 32 48 64; do
    install -Dm644 "$srcdir/$pkgname/install/icons/$res/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/$res/$pkgname.png"
  done
  ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

