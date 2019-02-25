# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=tscrape-git
pkgver=0.1.r0.gbd299de
pkgrel=1
pkgdesc='Twitter feed scraper'
url='https://git.codemadness.org/tscrape.html'
license=('ISC')
provides=('sfeed')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('curl')
makedepends=('git')
source=("${pkgname%-git}::git+git://git.codemadness.org/tscrape"
        "tscrape-git.patch" )
sha256sums=('SKIP'
            'cfd43838d2172abf6ef708598a3dc4bf2807b30bac637ac2f4a878728586aed2')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${pkgname%-git}"
  patch -Np1 -i "${srcdir}/tscrape-git.patch"
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
