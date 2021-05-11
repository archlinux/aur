# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=ripme
pkgver=1.7.95
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/RipMeApp/ripme"
license=('MIT')
depends=('java-runtime')
makedepends=('maven')
source=("https://github.com/RipMeApp/ripme/archive/$pkgver.tar.gz")
sha256sums=('bf631cbc19cd0a16546aa1125fc12526f63e6d793f4de5e8f31f3f48d17a70b9')

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
