# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards"
pkgver=0.7.9
pkgrel=1
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=('fuse2' 'uucp')
makedepends=('yarn')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('224e73ad733ecc03da5caa6fd460ed7d63f65f2d15134397f7eb978bdf174f4e')

prepare() {
    cd "${pkgname^}-$pkgname-$pkgver"
    sed -i -e 's,algernon/avr.*",^4.2.4",g' package.json
    sed -i -e '/prettier/d' .eslintrc.js
    yarn --cache-folder "$srcdir/node_modules" install --no-lockfile
}

build() {
    cd "${pkgname^}-$pkgname-$pkgver"
    yarn --cache-folder "$srcdir/node_modules" run build:linux
}

package() {
    cd "${pkgname^}-$pkgname-$pkgver/dist"
    install -Dm755 ${pkgname^}-$pkgver.AppImage "$pkgdir/usr/bin/$pkgname"
}
