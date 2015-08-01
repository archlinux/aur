# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

_pkgname=mwparserfromhell
pkgname=python-mwparserfromhell-git
pkgdesc="A Python parser for MediaWiki wikicode"
pkgver=0.4.2.r2.g5cf1309
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/earwig/mwparserfromhell"
license=('MIT')
depends=('python')
makedepends=('git')
source=('git://github.com/earwig/mwparserfromhell')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

check() {
  cd "$_pkgname"
  python setup.py test
}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
