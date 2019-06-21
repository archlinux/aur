# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=micronaut
pkgver=1.1.3
pkgrel=1
pkgdesc="Application Framework"
arch=('x86_64')
url="https://github.com/micronaut-projects/micronaut-core"
license=(Apache)
depends=('java-environment>=8')
source=(https://github.com/micronaut-projects/micronaut-core/archive/v${pkgver}.tar.gz)
sha512sums=('32c2342968cdb508c4e0238a639b465e6f6455375336c4a0ee71ceeb2256c6874127933441da23da66d30b1725970d13d51eece1298f1b6a7da8d34c64c4611d')

build() {
  cd "$srcdir/micronaut-core-$pkgver"

  ./gradlew cli:fatJar
}

package() {
  cd "$srcdir/micronaut-core-$pkgver"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/micronaut
  cp -r cli/build/* "$pkgdir"/usr/lib/micronaut

  mv "$pkgdir"/usr/lib/micronaut/bin/mn "$pkgdir"/usr/bin/mn
  sed -i "s|^APP_HOME.*$|APP_HOME=/usr/lib/micronaut|" "$pkgdir"/usr/bin/mn
}

# vim:set ts=2 sw=2 et:
