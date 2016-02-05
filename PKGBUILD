pkgname=p2pvc-git
pkgver=0.r195.41f2ae9
pkgrel=1
pkgdesc="A point to point color terminal video chat"
arch=('i686' 'x86_64')
url="https://github.com/mofarrell/p2pvc"
license=('MIT')
depends=('opencv' 'portaudio' 'ncurses')
makedepends=('git')
provides=('p2pvc')
source=("$pkgname"::'git+https://github.com/mofarrell/p2pvc.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/p2pvc" "$pkgdir/usr/bin/p2pvc"
  install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
