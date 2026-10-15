# Maintainer: Max Rossmannek <max@rossmannek.de>

pkgname=cobib-zotero
pkgver=0.2.2
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
sha512sums=('4b41e7b88631a7c45381ec001450c064e5cad703d266e6e754bd641c6a454c36f2108a584c1896a2269220e344b65cabff4e490b1ed8631f9940c470bab37ea8')

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
