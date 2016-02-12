# $Id: PKGBUILD 48930 2011-06-07 18:55:04Z angvp $
# Maintainer: Angel Velasquez <angvp@archlinux.org>
pkgname="python-sqlalchemy-doc"
pkgver=1.0.11
pkgdesc="Python SQL toolkit and Object Relational Mapper Documentation"
pkgrel=1
arch=('any')
url="http://www.sqlalchemy.org/"
license=('MIT')
makedepends=('python-sphinx' 'python-mako' 'python-sphinx-paramlinks')
source=("http://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
sha256sums=(0b24729787fa1455009770880ea32b1fa5554e75170763b1aef8b1eb470de8a3)

build() {
  cd "${srcdir}/SQLAlchemy-${pkgver}"
  python setup.py build_sphinx
}

package() {
  cd "${srcdir}/SQLAlchemy-${pkgver}"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  while read -d ''; do
    install -Dm644 "$REPLY" "$pkgdir/usr/share/doc/$pkgname/${REPLY#build/sphinx/html/}"
  done < <(find doc/build/output/html -type f -print0)
}
