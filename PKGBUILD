# Maintainer: Max Rossmannek <max@rossmannek.de>

pkgname=cobib-zotero
pkgver=0.2.2
pkgrel=2
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
sha512sums=('b78305163cd6b96f532feb0201e95b56d0112104e0c53148c44520e226aa8df739ddc6da9e9009ac7560f9565759cee6582bec78870800310adb32101f54270e')

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
