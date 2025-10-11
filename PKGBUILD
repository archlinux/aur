# Maintainer: Max Rossmannek <max@rossmannek.de>

pkgname=cobib-zotero
pkgver=0.1.0
pkgrel=1
arch=('any')
depends=(
    'cobib'
    'python'
    'python-pyzotero'
)
license=('MIT')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib-zotero')
conflicts=('cobib-zotero')
pkgdesc="Zotero importer plugin for coBib"
url="https://gitlab.com/cobib/${pkgname}"
source=("https://gitlab.com/cobib/cobib-zotero/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('c1b9393098897b427dce57a51ad92e539ca63e55bad371789bedcb8ea88e06b9cee143265c4859c02b6a9d54df7ebf1a8d3a2d5198e76952e4e9bd3598fce445')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
