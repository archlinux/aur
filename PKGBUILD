# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: AJ <aj[at]nqrith[dot]com>

pkgname='mtree'
_pkgname='mtree-port'
pkgver=1.0.4
pkgrel=1
pkgdesc='Utility for creating and verifying file hierarchies'
arch=('i686' 'x86_64')
url="https://github.com/archiecobbs/mtree-port"
license=('BSD')
depends=('openssl')
source=("https://github.com/archiecobbs/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c57088a0b7ea54a2706175a49c3b89d5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 mtree   "${pkgdir}"/usr/bin/mtree
# install -Dm644 mtree.5 "${pkgdir}"/usr/share/man/man5/mtree.5 ### conflicts with libarchive that already installs mtree.5
  install -Dm644 mtree.8 "${pkgdir}"/usr/share/man/man8/mtree.8
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
