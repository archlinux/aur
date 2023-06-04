# Maintainer:
# Contributor: Alexey Manukhin <axxapy@gmail.com>

_pkgname="php-runkit"
pkgname="$_pkgname"
pkgdesc='Tools to allow what Reflection does not. Useful for unit tests.'
pkgver=4.0.0a6.r1.g8ffec37
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url="https://github.com/runkit7/runkit7"

depends=('php')
makedepends=('php')

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  phpize
  ./configure
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -vDm0644 "$srcdir/$_pkgname/modules/runkit7.so" "$pkgdir/usr/lib/php/modules/runkit7.so"

  echo 'extension=runkit7.so' > "$srcdir/runkit7.ini"
  echo 'runkit7.internal_override=1' >> "$srcdir/runkit7.ini"
  install -vDm0644 "$srcdir/runkit7.ini" -t "$pkgdir}/etc/php/conf.d"
}

