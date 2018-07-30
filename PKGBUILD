# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=beansdb
pkgver=0.7.1.4
pkgrel=1
pkgdesc="Yet another distributed key-value storage system from Douban Inc."
url="https://github.com/douban/beansdb"
arch=('x86_64')
license=('custom')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c89f267484dd47bab272b985ba0a9b9196ca63a9201fdf86963b8ed04f52ccdb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # license
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # document
  install -D -m644 doc/protocol.txt "${pkgdir}/usr/share/doc/${pkgname}/protocol.txt"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 {AUTHORS,ChangeLog,CREDITS,INSTALL,NEWS,TODO} "${pkgdir}/usr/share/doc/${pkgname}/"

  # examples
  install -d -m755 "${pkgdir}"/usr/share/doc/"${pkgname}"/{go_test,python,python_tests}/
  install -D -m644 go_test/* "${pkgdir}/usr/share/doc/${pkgname}/go_test/"
  install -D -m644 python/* "${pkgdir}/usr/share/doc/${pkgname}/python/"
  install -D -m644 python_tests/* "${pkgdir}/usr/share/doc/${pkgname}/python_tests/"
}
