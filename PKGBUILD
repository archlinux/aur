# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=sfeed-git
pkgver=0.9.7.r0.ge59ad05
pkgrel=1
pkgdesc='RSS and Atom parser'
url='https://git.codemadness.org/sfeed'
license=('ISC')
provides=('sfeed')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('git')
depends=('curl')
source=("${pkgname%-git}::git+git://git.codemadness.org/sfeed"
        "sfeed-git.patch")
sha256sums=('SKIP'
            '9057f4b96368207c382a2a4b022a5a2f5bcac733f55225347b6b6dbc46fa6edb')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${pkgname%-git}"
  patch -Np1 -i "${srcdir}/sfeed-git.patch"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
