# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=hgview
pkgver=1.10.7
pkgrel=1
pkgdesc="A fast Mercurial log navigator"
arch=('any')
url="https://www.logilab.org/project/hgview/"
license=('GPL')
depends=('mercurial>=1.6' 'python2-urwid' 'python2-pyinotify' 'python2-pygments' 'python2-pyqt4')
makedepends=('asciidoc' 'xmlto')
source=(http://download.logilab.org/pub/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('49f009d3b04f5e0aade7bf9bb3a70345e688467a84a78d202d24fd98781cac5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  # fix man page placement
  install -d "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/man

  # fix FS#59623
  rm "$pkgdir"/usr/lib/python2.7/site-packages/hgext3rd/__init__.*
}
