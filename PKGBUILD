# Maintainer: macinsight <git@macinsight.net>
# Contributor: Philip Nelson <7PMNelson@gmail.com>
_pkgname=mwcleric
pkgname=python-mwcleric-git
pkgdesc="General purpose tools for MediaWiki editing using Python"
pkgver=6b224f0
pkgrel=1
arch=('any')
url="https://github.com/RheingoldRiver/mwcleric"
license=('MIT')
depends=('python' 'python-mwparserfromhell' 'python-pytz' 'python-mwclient')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/RheingoldRiver/mwcleric')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

