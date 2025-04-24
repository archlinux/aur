# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=lavinmq
pkgver=2.3.0
pkgrel=1
pkgdesc="Lightweight and fast AMQP (0-9-1) server."
arch=("x86_64")
url="https://lavinmq.com/"
license=("Apache 2.0")
depends=("gc-large-config" "libevent" "pcre2" "openssl" "zlib" "lz4")
makedepends=("make" "help2man" "crystal>=1.15.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cloudamqp/lavinmq/archive/v${pkgver}.tar.gz"
        lavinmq.sysusers)
sha256sums=('ff8d4f013de7c3b04298f967e1119935fca299d4580108c5fef7a27fcae54653'
            'c148e576e55f71953d57aeff4270b21864d6a1f865df5411aa33471cc21ae2f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" UNITDIR="/usr/lib/systemd/system"
  install -Dm 644 ../${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
