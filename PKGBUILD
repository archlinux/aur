# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=sfeed-git
pkgver=0.9.16.r9.g785a50c
pkgrel=1
pkgdesc='RSS and Atom parser'
url='https://codemadness.org/sfeed.html'
license=('ISC')
provides=('sfeed')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('curl')
makedepends=('git')
source=("${pkgname%-git}::git+git://git.codemadness.org/sfeed"
        "sfeed-git.patch")
sha256sums=('SKIP'
            '5f2e89b58dd9bb70dfe27b696e1efaab1d94af443e9119ac79158f2871387f79')

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
