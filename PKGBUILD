# derived from @dreieck: postforward-git
pkgname=postforward
pkgver=1.1.1
pkgrel=1
pkgdesc="A mail forwarding utility which aims to compliment postsrsd: Instead of rewriting all incoming mail regardless of final destination, only to-be-forwarded mail is passed to postsrsd."
url="http://github.com/zoni/postforward"
license=('BSD')
arch=('i686' 'x86_64' 'arm' 'arm64')
depends=('postsrsd')
makedepends=('go')
options=('emptydirs' 'strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zoni/postforward/archive/v$pkgver.tar.gz")

md5sums=('2f35c8d97a62033922cfc9611c090df0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -D -m755 postforward "${pkgdir}/usr/bin/postforward"

  for _docfile in CHANGES.md README.md; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done

  install -v -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
