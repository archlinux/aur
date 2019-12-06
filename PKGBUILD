# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=nodejs-markdown-toc
pkgver=1.2.0
pkgrel=1
pkgdesc="generate markdown TOC (table of contents)"
arch=('any')
url="https://github.com/jonschlinkert/markdown-toc"
license=('custom')
depends=('nodejs')
makedepends=('npm')
source=("markdown-toc-$pkgver.tar.gz::https://github.com/jonschlinkert/markdown-toc/archive/$pkgver.tar.gz")
md5sums=('16bc26b1cc25976c624b36939967c5aa')

package() {
  # shellcheck disable=2154
  npm install -g \
    --user root \
    --prefix "$pkgdir"/usr \
    "$srcdir"/markdown-toc-$pkgver.tar.gz

  # clean up npm problems
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"

  install -Dm644 \
    "$srcdir"/markdown-toc-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
