# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=mkpwd
pkgver=1.6
pkgrel=5
pkgdesc="Command line password generator"
arch=('x86_64' 'i686')
url='https://www.o-schroeder.de/projects/mkpwd'
license=('GPL-3.0-or-later')
depends=('glibc'
         'libxcrypt')
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
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dvm644 AUTHORS ChangeLog README \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
