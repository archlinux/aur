# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme
pkgver=1.7.93
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
makedepends=('maven')
source=("https://github.com/RipMeApp/ripme/archive/$pkgver.tar.gz")
sha256sums=('7ca95a3752eac6f3b6f46b3143822e32306aec9fdfd5d0c46ea3be46e7f6b6d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mvn clean compile assembly:single
  cat << EOF > ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "target/ripme-$pkgver-jar-with-dependencies.jar" \
    "$pkgdir/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "$pkgdir/usr/bin/ripme"
}
