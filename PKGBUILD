# Maintainer: Philip Nelson <7PMNelson@gmail.com>
_pkgname=mwrogue 
pkgname=python-mwrogue-git
pkgdesc="A library is a client for connecting to, and occasionally editing, the Fandom/Gamepedia esports wikis"
pkgver=1cae5a2
pkgrel=1
arch=('any')
url="https://github.com/RheingoldRiver/mwrogue"
license=('MIT')
depends=('python' 'python-mwparserfromhell' 'python-pytz' 'python-mwclient' 'python-mwcleric-git' 'python-unidecode')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/RheingoldRiver/mwrogue')
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

