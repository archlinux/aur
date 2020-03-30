# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=tscrape-git
pkgver=0.4.r9.g8e11f80
pkgrel=1
pkgdesc='Twitter feed scraper'
url='https://git.codemadness.org/tscrape.html'
license=('ISC')
provides=('tscrape')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('curl')
makedepends=('git')
source=("${pkgname%-git}::git+git://git.codemadness.org/tscrape"
        "tscrape-git.patch" )
sha256sums=('SKIP'
            '1912e1fcc8ac0d3edc7dad5a96ffa7091c0057611c2dc538780e4a5e5d809d18')

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
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
