# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=mkpwd
pkgver=1.6
pkgrel=4
pkgdesc="Command line password generator"
arch=('i686' 'x86_64')
url='https://www.o-schroeder.de/projects/mkpwd'
license=('GPL3')
source=("https://www.o-schroeder.de/download/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-compile.patch")
sha256sums=('6db5032fa6e2bc3ebd499ebf2b94f8df5b3ce64760d84fda7101e951bfb5c88a'
            'a32e55249f4c6cad8b52d8fdfca3830a9cd8e6a20dafeb4145a15e2ad3371e05')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix compilation
  patch -p1 -i "${srcdir}/${pkgname}-${pkgver}-compile.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dvm644 AUTHORS ChangeLog README \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
