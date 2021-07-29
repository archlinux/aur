# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=httest
pkgver=2.4.24
_short_ver=${pkgver%.*}
pkgrel=1
pkgdesc="HTTP Test Tool"
arch=('i686' 'x86_64')
url="https://htt.sourceforge.net"
license=('APACHE')
source=("https://downloads.sourceforge.net/project/htt/htt${_short_ver}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-guide.pdf::https://downloads.sourceforge.net/project/htt/htt${_short_ver}/${pkgname}-${pkgver}/users-guide.pdf")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/^apr_time_t start_time;$/static apr_time_t start_time;/' \
          src/date_module.c \
          src/perf_module.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure  --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D -m644  "${srcdir}/${pkgname}-${pkgver}-guide.pdf" "${pkgdir}/usr/share/doc/${pkgname}/users-guide.pdf"
}
sha256sums=('b154361a6ed7aa07bfe86b874a84b2c24e09aafa1f0c23d94ad5989914e22cdf'
            'fda1c737c325582faaa772a6fb0e6f49a4de4ece5c0bd42771ad5fe91a644972')
