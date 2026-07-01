pkgname=libelectron
pkgver=2026.4
pkgrel=1
libsplashver=1.0
libadblockver=1.0
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
sha256sums=('5619174b56786bf6fde393aa2f9915992457f3ffec691d5ac007e71a5f1ee170'
            'faaa3f1b356e816068e49b745add4bf80f4fedb8c9d5ddf51c57cba6b019aa51'
            'b5af671dc83ebd85c3f9f892c3552664d4faa53f9568e5c2ba5df95875ec850a')
source=(
"$url/libelectron/-/archive/$pkgver/libelectron-$pkgver.tar.bz2"
"$url/libsplash/-/archive/$libsplashver/libsplash-$libsplashver.tar.bz2"
"$url/libadblock/-/archive/$libadblockver/libadblock-$libadblockver.tar.bz2")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --legacy-peer-deps --omit=dev
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"
    cp -r "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron"

    #LibSplash
    install -dm755 "$pkgdir/opt/libelectron/libsplash"
    cp -a "$srcdir/libsplash-$libsplashver/." "$pkgdir/opt/libelectron/libsplash/"

    #Libadblock
    install -dm755 "$pkgdir/opt/libelectron/libadblock"
    cp -a "$srcdir/libadblock-$libadblockver/." "$pkgdir/opt/libelectron/libadblock/"
}
