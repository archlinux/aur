# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=sfeed-git
pkgver=0.9.8.r3.gb3c9ad3
pkgrel=2
pkgdesc='RSS and Atom parser'
url='https://codemadness.org/sfeed-simple-feed-parser.html'
license=('ISC')
provides=('sfeed')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('curl')
makedepends=('git')
source=("${pkgname%-git}::git+git://git.codemadness.org/sfeed"
        "sfeed-git.patch")
sha256sums=('SKIP'
            '1700a32d9c79b63d48ee4a84fe8d9127a368c8e7c9911108a49df140f000b8ce')

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
