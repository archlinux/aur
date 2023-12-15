# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=4.4.0
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/cobib/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-lxml' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib' 'python-text-unidecode' 'python-rich' 'python-textual' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-linkify-it-py')
source=("https://gitlab.com/cobib/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('82ed81c47e52c3695b3f47c8c9e3f7062a0f9ae41c28d2cc7239a0e610fd873013ffb744eeb7a2f91c4be17b61978630109dbbda094d64dc999d36ad90a0a24e')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install_extras
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
