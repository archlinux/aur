# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>

pkgname="python-beancount-import"
_name="beancount-import"
pkgver=1.5.0
pkgrel=1
pkgdesc="Semi-automatic importer from external data sources into beancount"
arch=("any")
url="https://github.com/jbms/beancount-import"
license=("GPL-2.0-only")
depends=("beancount"
         "beangulp"
         "beanquery"
         "python"
         "python-atomicwrites"
         "python-cachetools"
         "python-dateutil"
         "python-jsonschema"
         "python-nltk"
         "python-numpy"
         "python-scikit-learn"
         "python-scipy"
         "python-tornado"
         "python-typing_extensions"
         "python-watchdog")
makedepends=("npm" "python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
# PyPI only has a wheel, the frontend is bundled from the GitHub sources
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7249d5feeb3ff3dba498336cf5778535029f28ad148f2ab5d5731dd9d867af3')

build(){
 cd "$_name-$pkgver"
 export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
