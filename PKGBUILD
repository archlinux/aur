# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmifs
pkgdesc="A network monitor for all network devices that shows the transmission ratio"
pkgver=1.3b1
pkgrel=1
arch=(i686 x86_64)
url="http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/net.html"
license=('GPL')
depends=('libxpm')
source=("http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmifs-1.3b1.tar.gz"
	"wmifs.patch"
	"wmifs.1")
md5sums=('4a6ec0141792debac2803e0697fa1dd6'
         'd7583278ebea71bc8798337268e56ea3'
         'a4a2e3977d451946f1fee93a70f6a17f')

prepare() {
  cd "${srcdir}"
  patch -Np1 -b -z .orig -i wmifs.patch
}

build() {
  cd "${srcdir}/wmifs.app/wmifs"
  make
}

package() {
  cd "${srcdir}/wmifs.app/wmifs"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 ../../wmifs.1 "${pkgdir}/usr/share/man/man1/wmifs.1"
}
