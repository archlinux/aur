# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme
pkgver=1.7.94
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
makedepends=('maven')
source=("https://github.com/RipMeApp/ripme/archive/$pkgver.tar.gz")
sha256sums=('af229bd6ed7cbba36b612eaa12ecd658503da2a0a59b01d57499a0b0e657b728')

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
