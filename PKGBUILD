# Maintainer: Thermi <noel [at] familie-kuntze dot de>

pkgname=ndppd
pkgver=0.2.4
pkgrel=1
pkgdesc="IPv6 NDP proxy daemon"
url='https://github.com/DanielAdolfsson/ndppd'
license=("GPL3")
arch=('i686' 'x86_64')
backup=('etc/ndppd.conf')

source=("https://github.com/DanielAdolfsson/ndppd/archive/${pkgver}.tar.gz"
	"ndppd.service")

sha256sums=('dd6ca5b27a7aed4f23633888a1ff9c15b402911b4dc1b514854f54d12907ddd8'
            'b8c1e3ab37cebc2aeb83873cba719fdc919fd5d2832170011ff8da471972e061')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr SBINDIR=/${pkgdir}/usr/bin DESTDIR=${pkgdir} install
  install -D -m 644 "${srcdir}/ndppd.service" "${pkgdir}/usr/lib/systemd/system/ndppd.service"
  install -D -m 644 ndppd.conf-dist "${pkgdir}/etc/ndppd.conf"
}

