# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=prey
pkgver=02192009
pkgrel=1
pkgdesc="Prey is a first person shooter based on the id Tech 4 engine using portals and variable gravity. You need the retail game files to play."
arch=('i686' 'x86_64')
url="http://icculus.org/prey/"
license=('GPL')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libstdc++5' 'lib32-libxext')
else
    depends=('libstdc++5' 'libxext')
fi
makedepends=('unzip')
install=prey.install
source=("prey.desktop" "prey.launcher" \
"http://icculus.org/prey/downloads/$pkgname-installer-$pkgver.bin")
md5sums=('e0fc6542975fd67f2cb43a2a19f2e605'
         '23e6e301fa851b58b6d4b1a5f7eb3b5f'
         'f2d8ec21b5d082b516774f62a8bb6e97')

build() {
  # Extract Files
  unzip $srcdir/$pkgname-installer-$pkgver.bin

  # Create Destination Directory
  install -d $pkgdir/opt/prey/

  # Install Game Files
  cp -r $srcdir/data/prey-linux-x86/* \
    $pkgdir/opt/prey/

  # Install Data Files
  cp -r $srcdir/data/prey-linux-data/* \
    $pkgdir/opt/prey/

  # Install Punkbuster Files
  cp -r $srcdir/data/punkbuster-linux-x86/* \
    $pkgdir/opt/prey/

  # Install Default Config
  cp $srcdir/data/configs/english.cfg \
    $pkgdir/opt/prey/base/default.cfg

  # Install License (Prey)
  install -D -m 0644 $srcdir/data/prey_license.txt \
    $pkgdir/usr/share/licenses/$pkgname/prey_license.txt

  # Install License (Punkbuster)
  install -D -m 0644 $srcdir/data/punkbuster_license.txt \
    $pkgdir/usr/share/licenses/$pkgname/punkbuster_license.txt

  # Install Desktop Shortcut
  install -D -m 0644 $srcdir/prey.desktop \
    $pkgdir/usr/share/applications/prey.desktop

  # Install Client Launcher
  install -D -m 0755 $srcdir/prey.launcher \
    $pkgdir/usr/bin/prey
}

