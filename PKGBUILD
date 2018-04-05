# Maintainer: Cedric Meury <cedric@meury.com>
# Maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=kafka-manager
pkgver=1.3.3.17
pkgrel=1
pkgdesc="A tool for managing Apache Kafka."
arch=('any')
url="https://github.com/yahoo/kafka-manager"
license=('Apache')
groups=()
# running kafka-manager requires java8
depends=('java-environment=8'
         'bash')
makedepends=('sbt'
             'unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/kafka-manager.conf')
options=()
install=$pkgname.install
changelog=
source=(https://github.com/yahoo/$pkgname/archive/$pkgver.tar.gz
        ${pkgname}.conf
        ${pkgname}.service)
md5sums=('cf9a82bc684bbdebe5820d50d67053f8'
         '8ee7f7d85857bfad3ad087678a47d270'
         '22db3c3ad6b7772fad5513b5438b707b')

build() {
  cd "$pkgname-$pkgver"
  ./sbt clean dist
}

package() {
  mkdir $pkgdir/opt
  unzip -q $srcdir/$pkgname-$pkgver/target/universal/$pkgname-$pkgver.zip -d $pkgdir/opt
  ln -s "/opt/$pkgname-$pkgver" "${pkgdir}/opt/$pkgname"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -D -m644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
}
