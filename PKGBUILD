# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgname=bgpstream
pkgver=2.3.0
pkgrel=1
pkgdesc="An open-source software framework for live and historical BGP data analysis, supporting scientific research, operational monitoring, and post-event analysis"
arch=('x86_64')
url="https://bgpstream.caida.org"
license=('GPL')
depends=("libwandio>=1.0.3" "librdkafka")
makedepends=('sqlite3' 'git')
optdepends=("sqlite3: sqlite data interface")
source=("https://github.com/CAIDA/libbgpstream/releases/download/v${pkgver}/libbgpstream-${pkgver}.tar.gz")
md5sums=('1ed902296b0dfefa74eb2844fe98493b')

build() {
  cd "${srcdir}/libbgpstream-${pkgver}"
  
  # fix from #227 on GitHub
  sed -i '13436 i #define _GNU_SOURCE' configure

  ./configure --prefix=/usr --with-sqlite
  make
}

package() {
  cd "${srcdir}/libbgpstream-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
