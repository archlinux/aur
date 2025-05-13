# Maintainer: Acid <acidbunrmoneky@gmail.com>
pkgname=rname
pkgver=1.0
pkgrel=1
pkgdesc="A simple file rename utility written in Java"
arch=('any')
url="https://github.com/acidburnmonkey/Rname"
license=('GPL3')
depends=('java-runtime>=21')
makedepends=('maven' 'java-environment>=21')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('267c64c7f3a9332ce9fb768d00a56d08c93ee8a55d304e859686998bcf8a2177')

build() {
  cd "$srcdir/Rname-$pkgver"
  mvn dependency:go-offline
  mvn --offline -DvalidatePom=false clean package
}

package() {
  cd "$srcdir/Rname-$pkgver"
  install -Dm644 "target/${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/$pkgname/$pkgname-${pkgver}.jar"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec java -jar /usr/share/$pkgname/$pkgname-${pkgver}.jar "\$@"
EOF
}

