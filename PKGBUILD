# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=ivy
pkgver=2.5.1
pkgrel=1
pkgdesc='Agile dependency manager'
arch=('any')
url='https://ant.apache.org/ivy/'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('ant')
source=("https://apache.uib.no/ant/ivy/$pkgver/apache-ivy-$pkgver-src.tar.gz"
        'ivy.sh')
sha256sums=('41c9aa4263d6c0564e9d8bcc4ef4dedb0dd72fd2e5324c6b7f23267bba432076'
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
