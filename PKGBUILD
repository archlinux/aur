# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=apart-gtk
pkgver=0.2
pkgrel=2
pkgdesc="Linux GUI for cloning/restoring partitions to/from compressed image files"
arch=('any')
url="https://github.com/alexheretic/apart-gtk"
license=('GPL3')
depends=('python'
         'python-gobject'
         'gtk3'
         'pigz'
         'partclone'
         'zeromq')
optdepends=('polkit: to run apart directly from menu')
makedepends=('python-pip'
             'python-wheel'
             'rustup'
             'git')
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/alexheretic/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('a8a2eae3aae7949de9bac1d767783fc197cac301f8a8ed79e0936829203bb8dd'
            '61385c6c56ce4dca43eda716b59931288e1b52484f5a9f3ff3c31e00af2ac87a')
validpgpkeys=('1D2698841A943AC5B53BF604E1355A2F8E415521')

build() {
  cd "$pkgname-$pkgver"
  ./build-dist  # build to ./target
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/"
  cp -r target/* "$pkgdir/usr/"
}
