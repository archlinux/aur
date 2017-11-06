# Maintainer:  Jennifer Zhou <0@jezh.me>
pkgname=swagger-codegen-git
pkgver=2.2.3.r878.g39a9c5587f
pkgrel=1
pkgdesc="A template-driven engine to generate documentation, API clients and server stubs"
arch=('any')
url="https://swagger.io/swagger-codegen/"
license=('Apache')
depends=('java-environment')
makedepends=('maven')
checkdepends=()
optdepends=()
provides=('swagger-codegen')
conflicts=('swagger-codegen')
source=("$pkgname::git+https://github.com/swagger-api/swagger-codegen.git"
        swagger-codegen)
sha256sums=('SKIP'
            'b1c49877eaf8905f0d6d297a7a68692b5137e24df44ddf585f45033962c4e3ab')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | tr -d v
}

build() {
  cd "$srcdir/$pkgname"

  mvn clean package
  cp "$srcdir/$pkgname/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar" "$srcdir/swagger-codegen-cli.jar"
}

check() {
  cd "$srcdir/$pkgname"

  mvn test
}

package() {
  cd "$srcdir"

  install -d -m 755 "$pkgdir/usr/share/java/swagger-codegen"
  install -m 644 swagger-codegen-cli.jar "$pkgdir/usr/share/java/swagger-codegen"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 swagger-codegen "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
