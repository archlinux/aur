# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=concierge
pkgver=0.2.2
pkgrel=4
pkgdesc='Think SASS for SSH config files'
license=('MIT')
url='https://github.com/9seconds/concierge'
depends=('python-inotify-simple')
makedepends=('python-setuptools')
optdepends=('concierge-jinja: jinja2 support in your templates'
            'concierge-mako: mako support in your templates')
source=("https://github.com/9seconds/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7bccfc87c9988ae87630d33509d5c356420c4a79cab2960813c4184cd71fc4eb')
arch=('any')
options=(!emptydirs)
install=concierge.install

prepare() {
  cd $srcdir/${pkgname}-$pkgver
  sed -i 14d setup.py
  sed -i 's/^\([ ]*\)"inotify_simple",$/\1"inotify_simple"/' setup.py

  sed -i 's/^VALID_OPTIONS = set(($/VALID_OPTIONS = set((\n    "AddKeysToAgent",/' \
      concierge/core/parser.py
}

package() {
  cd $srcdir/${pkgname}-$pkgver
  python setup.py install --root=$pkgdir
}
