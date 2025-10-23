# Maintainer: Max Rossmannek <max@rossmannek.de>

pkgname=cobib-zotero
pkgver=0.2.0
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
source=("https://gitlab.com/cobib/cobib-zotero/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha512sums=('6e8eda1ed8069f81b8cdc0553e65c4bfd4d2b2765669291659d2d3a29b970d904da0a0fb5055c45cf32ecc01aec0886d3d7e3c4bc7177ab92aa6155fcca72342')

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
