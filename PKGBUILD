
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch"
pkgver=0.2.0
pkgrel=2
pkgdesc="A fresh take on Neofetch"
arch=('any')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=()
makedepends=('cargo' 'luajit')
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch-git' 'freshfetch-bin')
source=('git://github.com/K4rakara/freshfetch.git'
		"https://raw.githubusercontent.com/K4rakara/${pkgname//-git}/master/LICENSE.md")
md5sums=('SKIP'
         'a4c191c500e67564935777e1abaebbab')

build() {
  cd $srcdir/freshfetch/;
  git checkout "${pkgver}";
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

