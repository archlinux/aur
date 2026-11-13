# Maintainer: agony <27015 at riseup dot net>
# Contributor: Russ Webber <russ at rw dot id dot au>
# Contributor: Homalozoa <xuhaiwang at xiaomi dot com>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-tools
pkgver=2.16.0
pkgrel=1
pkgdesc='LTTng tracing control tools'
arch=('x86_64')
url='https://lttng.org/'
license=('GPL2' 'LGPL2.1')
depends=('popt' 'liburcu>=0.7.2' "lttng-ust>=${pkgver%.*}.0" 'linux>=2.6.27' 'libxml2>=2.7.6')
makedepends=('asciidoc' 'xmlto')
optdepends=('lttng-modules: kernel tracing support'
            'babeltrace: view traces with `lttng view` command'
            'man-db: view man pages with the `lttng help` command')
provides=('lttng')
source=("https://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "https://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('b8b3244894e49e773d4942b8899f768057974edf75c18dbb48b65bb123c7b2c7'
            'SKIP')
validpgpkeys=('7F49314A26E0DE78427680E05F1B2A0789F12B11')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-man-pages --disable-tests
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
