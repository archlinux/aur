# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins
pkgver=437 
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/triceratops1/NatronVFX"
license=("GPL2")
makedepends=("git")
depends=("natron" "python" "python2" "ffmpeg")
source=("$pkgname::git://github.com/NatronVFX/natron-plugins.git")
md5sums=("SKIP")


pkgver() {
  cd "$srcdir/$pkgname"
  git rev-list --count HEAD
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update -i --recursive

   mkdir "$srcdir/$pkgname/png"
   mkdir "$srcdir/$pkgname/py"

   find . -type f -name *.png -exec mv {} ./png \;
   find . -type f -name *.py -exec mv {} ./py \;
}



package() {
    cd $srcdir/$pkgname/py
    mkdir -p "$pkgdir/usr/share/Natron/Plugins"

    cp -r * $pkgdir/usr/share/Natron/Plugins/
    cd $srcdir/$pkgname/png
    

    cp -r * $pkgdir/usr/share/Natron/Plugins/
}
