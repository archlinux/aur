# Maintainer: wicast <wicastchen at hotmail>
# Contributor: Pablo Astigarraga <pote at tardis.com.uy>

pkgname=go-gpm-all
pkgver=0.0.1.r1.gac6945d
pkgrel=1
pkgdesc="A gpm plugin for per-environment dependency groups."
arch=("any")
url="https://github.com/pote/gpm-all"
license=('MIT')
groups=()
depends=("go-gpm")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/pote/gpm-all.git" "name-conflict.patch")
md5sums=('SKIP' '6d3e324d63f2673ad1edb50a4d5415f2')
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/$pkgname/bin"
  patch gpm-all "$srcdir/name-conflict.patch"
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm=775 "./bin/gpm-all" "${pkgdir}/usr/bin/go-gpm-all"
}
