# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=sfeed-git
pkgver=0.9.7.r0.ge59ad05
pkgrel=2
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
            'facc036a5025d52f1ae10aa9b096a86e79072854bfb7e5ab9f5dc5d4d30c20e8')

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
