# Contributor: Slash <youremail@domain.com>

pkgname=prey-demo
pkgver=02192009
pkgrel=1
pkgdesc="Prey is a first person shooter based on the id Tech 4 engine using portals and variable gravity (Demo Version)."
arch=('i686' 'x86_64')
url="http://icculus.org/prey/"
license=('GPL')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libstdc++5' 'lib32-libxext')
else
    depends=('libstdc++5' 'libxext')
fi
makedepends=('unzip')
install=prey-demo.install
source=("prey-demo.desktop" "prey-demo.launcher" \
"http://icculus.org/prey/downloads/$pkgname-installer-$pkgver.bin")
md5sums=('076b4092529d9cc7d092c4630fced700'
         '637b319535afb902d4645030153acfbe'
         'dded67270bc59248f2b8fedd7d51156d')

build() {
  # Extract Files
  unzip $srcdir/$pkgname-installer-$pkgver.bin && true

  # Create Destination Directory
  install -d $pkgdir/opt/prey-demo/

  # Install Game Files
  cp -r $srcdir/data/prey-demo-linux-x86/* \
    $pkgdir/opt/prey-demo/

  # Install Data Files
  cp -r $srcdir/data/prey-demo-linux-data/* \
    $pkgdir/opt/prey-demo/

  # Install Punkbuster Files
  cp -r $srcdir/data/punkbuster-linux-x86/* \
    $pkgdir/opt/prey-demo/

  # Install Default Config
  cp $srcdir/data/configs/english.cfg \
    $pkgdir/opt/prey-demo/base/default.cfg

  # Install License (Prey)
  install -D -m 0644 $srcdir/data/prey_demo_license.txt \
    $pkgdir/usr/share/licenses/$pkgname/prey_demo_license.txt

  # Install License (Punkbuster)
  install -D -m 0644 $srcdir/data/punkbuster_license.txt \
    $pkgdir/usr/share/licenses/$pkgname/punkbuster_license.txt

  # Install Desktop Shortcut
  install -D -m 0644 $srcdir/prey-demo.desktop \
    $pkgdir/usr/share/applications/prey-demo.desktop

  # Install Client Launcher
  install -D -m 0755 $srcdir/prey-demo.launcher \
    $pkgdir/usr/bin/prey-demo
}

