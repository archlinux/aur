# Maintainer: Max Rossmannek <max@rossmannek.de>

pkgname=cobib-zotero
pkgver=0.2.1
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
    'python-setuptools-scm'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib-zotero')
conflicts=('cobib-zotero')
pkgdesc="Zotero importer plugin for coBib"
url="https://gitlab.com/cobib/${pkgname}"
source=("https://gitlab.com/cobib/cobib-zotero/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha512sums=('5e353a375073c2ab6887b8a9db1688eeb84eb0c55d5b2e17ca63a4c79a6d1f33d21795b84657b637d264cb4f99d887fb028b5a4640025ee26df9cf09dae7acff')

build() {
  cd "${srcdir}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
