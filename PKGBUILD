# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=httest
pkgver=2.4.2
# only works with single digit last field
_short_ver=${pkgver%.?}
pkgrel=1
pkgdesc="HTTP Test Tool"
arch=('i686' 'x86_64')
url="http://htt.sourceforge.net"
license=('APACHE')
source=("http://downloads.sourceforge.net/project/htt/htt${_short_ver}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-guide.pdf::http://downloads.sourceforge.net/project/htt/htt${_short_ver}/${pkgname}-${pkgver}/users-guide.pdf")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure  --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  cd "${srcdir}"
  cp "${pkgname}-${pkgver}-guide.pdf" "${pkgdir}/usr/share/doc/${pkgname}/users-guide.pdf"
}
sha256sums=('4532d948430de20fb1dac2e2212cc4fd7fb46c36751b93835c4f6bc2dcea8d40'
            '56ff2bd050f4978e07b1319c3c055a132c08425ef4a2a4f7e81d3f8d254244f1')
