# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=prey-demo
pkgver=02192009
pkgrel=1
pkgdesc="Prey is a first person shooter based on the id Tech 4 engine using portals and variable gravity (Demo Version)."
arch=('i686' 'x86_64')
url="http://icculus.org/prey/"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libstdc++5' 'lib32-libxext' 'lib32-openal' 'lib32-sdl')
else
    depends=('libstdc++5' 'libxext' 'openal' 'sdl')
fi
makedepends=('unzip')
install=prey-demo.install
source=("prey-demo.desktop" "prey-demo.launcher" \
"http://icculus.org/prey/downloads/$pkgname-installer-$pkgver.bin")
sha256sums=('f6df59507716e780fc5055356616d7b9310639a0332ca4830bef71cb7e72b074'
            '9ad1b50e362bc9843b54b237722be10332e902a32b0839f2c01a700f82ef0fd7'
            'cd2c179bb69224157411d90d7b613a3ce7a8214813c947ed7ccb2df5e15835f4')

package() {
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

