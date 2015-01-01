# Contributor: Leonidas <marek@xivilization.net>
pkgname=homeshick-git
pkgver=0.0.r372.dd9a0fd
pkgrel=1
pkgdesc="bash stand-in for homesick by technicalpickles"
arch=(any)
url="https://github.com/andsens/homeshick"
license=('BSD')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/andsens/homeshick.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
}

build() {
  sed -i 's|homeshick="\$repos/homeshick"|homeshick=/usr/lib/homeshick|' "$srcdir"/$pkgname/bin/homeshick
  # sed -i "s|for file in \$homeshick/lib/\*.sh;|for file in /usr/lib/homeshick/*.sh;|" "$srcdir"/$pkgname/bin/homeshick
  # sed -i "s|source \$homeshick|source /usr/lib/homeshick|" "$srcdir"/$pkgname/bin/homeshick
}

package() {
  # copy the 'binary' *ahem* script
  install -D "$srcdir"/$pkgname/bin/homeshick "$pkgdir"/usr/bin/homeshick
  # copy the utils scripts
  mkdir -p "$pkgdir"/usr/lib/homeshick/lib/
  cp -r "$srcdir"/$pkgname/lib "$pkgdir"/usr/lib/homeshick/
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$pkgname/LICENSE*
}
