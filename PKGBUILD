# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Benjamin Vialle <archlinux@vialle.io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
# Contributor: ianux <ianux@free.fr>

pkgname=woob-git
pkgver=3.7.r97.ga5391da3a
pkgrel=1
pkgdesc="Core library and modules for Web Outside of Browsers"
arch=(any)
url="https://woob.tech"
license=('LGPL3')
depends=('python-lxml'
         'python-cssselect'
         'python-requests'
         'python-dateutil'
         'python-yaml'
         'python-html2text'
         'python-six'
         'python-unidecode'
         'python-pillow'
         'python-babel'
         'python-simplejson'
         'python-schwifty>=2024.1'
         'python-deprecated'
         'python-rstr')
optdepends=('python-prettytable: CLI output formatting'
        'python-feedparser: required by some modules')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
replaces=('woob-headless' 'weboob' 'woob')
provides=('woob-headless' 'woob')
conflicts=('weboob-headless' 'weboob-git' 'weboob-qt' 'woob')
source=("woob::git+https://gitlab.com/woob/woob.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/woob"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/woob"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/woob"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

