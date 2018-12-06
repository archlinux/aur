# Maintainer: Florijan Hamzic <fh@infinicode.de>

pkgname='sphinx-bin'
pkgver=3.1.1
pkgrel=1
pkgdesc='Closed Source SQL full-text search engine.'
arch=('x86_64')
url='http://www.sphinxsearch.com/'
license=('GPL')
backup=('etc/conf.d/sphinx')
conflicts=("sphinx")
install='sphinx.install'

source=(
    'http://sphinxsearch.com/files/sphinx-3.1.1-612d99f-linux-amd64.tar.gz'
    'sphinx.conf.d'
    'sphinx.install'
    'sphinx.service')

package() {
  cd "${srcdir}/sphinx-${pkgver}"

  # create directories
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/etc/sphinx
  install -d "$pkgdir"/usr/share/sphinx/lib
  install -d "$pkgdir"/usr/share/licenses/sphinx

  mv etc/* "${pkgdir}"/etc/sphinx/
  mv api "${pkgdir}"/usr/share/sphinx/lib/api
  mv doc/license-* "$pkgdir"/usr/share/licenses/sphinx/
  mv doc "${pkgdir}"/usr/share/sphinx/lib/doc

  # create links
  for _f in "bin/"*; do
    install -Dm755 "bin/${_f##*/}" "${pkgdir}/usr/bin/${_f##*/}"
    ln -s "/usr/bin/${_f##*/}" "${pkgdir}/usr/bin/sphinx-${_f##*/}"
  done

  install -Dm644 "${srcdir}/sphinx.conf.d" "${pkgdir}/etc/conf.d/sphinx"
  install -Dm644 "${srcdir}/sphinx.service" "${pkgdir}/usr/lib/systemd/system/sphinx.service"
}

md5sums=('95342708882fb9417c1bafe6efa81bbd'
         '48e3e1857919d26d5104a48caffb531b'
         'a5968e77e1c2f7e69cd7431a78d37ae3'
         'fe06a8aff0520a6f75596ee43d2e5935')
