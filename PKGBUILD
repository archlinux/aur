# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Robert Gonciarz <goncairz (malpa) gmail (kropka) com>

pkgname=micronaut
pkgver=1.1.4
pkgrel=1
pkgdesc="Application Framework"
arch=('x86_64')
url="https://github.com/micronaut-projects/micronaut-core"
license=(Apache)
depends=('java-environment>=8' 'java-environment<12')
source=(https://github.com/micronaut-projects/micronaut-core/archive/v${pkgver}.tar.gz)
sha512sums=('10c07da8f796d96de1ceba99aaa21b76a86fe3a8261df849812d011b82a0373ee4d39503fef476240161fd4ed4eaac50bf12242db15f09f64c16d6292464dc98')

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
