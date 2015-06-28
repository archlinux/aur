# Maintainer: travisghansen <travisghansen@yahoo.com>
# Contributor: aleiphoenix <aleiphoenix@gmail.com>

pkgname=librabbitmq-c
pkgver=0.7.0
pkgrel=1
pkgdesc="A RabbitMQ(amqp) library written in C-language"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('popt' 'openssl')
makedepends=('cmake' 'doxygen' 'xmlto')
url=https://github.com/alanxz/rabbitmq-c
source=("${pkgname}-${pkgver}.zip::https://github.com/alanxz/rabbitmq-c/archive/v${pkgver}.zip")
md5sums=('32fd027ac01c2271615bee3e66afa00e')
options=(!libtool)

build() {
  cd ${pkgname:3}-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_EXAMPLES=OFF -DBUILD_TOOLS=ON -DBUILD_TOOLS_DOCS=ON -DBUILD_TESTS=OFF -DENABLE_SSL_SUPPORT=ON -DBUILD_API_DOCS=ON .
}

package() {
  cd ${pkgname:3}-$pkgver
  DESTDIR="${pkgdir}" cmake --build . --target  install
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
