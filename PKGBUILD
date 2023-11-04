# Maintainer: Pavel Vasin <rat4@blackcash.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=ivy
pkgver=2.5.2
pkgrel=1
pkgdesc='Agile dependency manager'
arch=('any')
url='https://ant.apache.org/ivy/'
license=('Apache')
depends=('java-runtime<=13')
makedepends=('ant')
source=("https://dlcdn.apache.org/ant/ivy/$pkgver/apache-ivy-$pkgver-src.tar.gz"
        "https://dlcdn.apache.org/ant/ivy/$pkgver/apache-ivy-$pkgver-src.tar.gz.asc"
        'ivy.sh')
validpgpkeys=('CE8075A251547BEE249BC151A2115AE15F6B8B72')
sha256sums=('e06edd472268dbf200c19d16fa595e095837cbac4a7bf29c147c301a0a1b0713'
            'SKIP'
            'fc719139726f670f0acf7b09016a4bb3c4ffdd7a0db88e11eb827467b475ad2d')

build() {
  cd "apache-$pkgname-$pkgver"

  ant jar -Divy.minimum.javaversion=1.8 -Divy.install.version=1.10
}

package() {
  install -Dm755 ivy.sh "$pkgdir/usr/bin/ivy"
  install -Dm644 "apache-$pkgname-$pkgver/build/artifact/jars/ivy.jar" \
    "$pkgdir/usr/share/java/ivy/ivy.jar"

  install -d "$pkgdir/usr/share/java/ant"
  ln -s /usr/share/java/ivy/ivy.jar "$pkgdir/usr/share/java/ant/ivy.jar"
}
