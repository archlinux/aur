
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch-git"
pkgver=v0.2.0.r5.g1383c8f
pkgrel=1
pkgdesc="A fresh take on Neofetch"
arch=('any')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=('luajit')
makedepends=('cargo' 'git')
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch' 'freshfetch-git')
source=('git+https://github.com/K4rakara/freshfetch.git'
        "https://raw.githubusercontent.com/K4rakara/${pkgname//-git}/master/LICENSE.md")
md5sums=('SKIP'
         'a4c191c500e67564935777e1abaebbab')

pkgver() {
  cd $srcdir/freshfetch/;
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g';  
}

build() {
  cd $srcdir/freshfetch/;
  cargo build \
    --release \
	-vv;
}

package() {
  install \
    -Dm755 \
	$srcdir/${pkgname//-git}/target/release/${pkgname//-git} \
	$pkgdir/usr/bin/${pkgname//-git};
  install \
    -Dm644 \
    $srcdir/LICENSE.md \
    $pkgdir/usr/bin/licenses/${pkgname}/LICENSE;
}

