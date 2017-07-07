#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=hogc
pkgver=0.0.1
pkgrel=9
pkgdesc="human detection in C++ and opencv"
arch=('any')
url="https://github.com/Chipsterjulien/hogc"
license=('WTFPL')
makedepends=('opencv' 'cmake')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=hogc.install

_builddir="$pkgname-$pkgver"

build() {
  cd "$_builddir"
  # run cmake .
  cmake . || return 1
  # run make
  make || return 1
}

package() {
  cd "$_builddir"

  # hogc_sample.ini
  install -Dm644 cfg/"$pkgname"_sample.ini \
    "$pkgdir"/etc/$pkgname/"$pkgname"_sample.ini || return 1

  # hogc binary
  install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname \
      "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('8fbf5758c01b45f531bccaa435879996671df0eb8e5c6297d5ada632a8cfe130e5719f168e6fe8d6d5ad746f84216e91dde2adccd7ad49267cabf9c2167ef546')
