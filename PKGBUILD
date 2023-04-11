# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>

pkgname="python-beancount-import-git"
pkgver=1.3.5.r44.gf108b59
pkgrel=1
pkgdesc="Semi-automatic importer from external data sources into beancount"
url="https://github.com/jbms/beancount-import"
arch=("any")
license=("MIT")
provides=("beancount-import")
conflicts=("beancount-import" "beancount-import-git" "python-beancount-import")
depends=("beancount"
         "python"
         "python-atomicwrites"
         "python-dateutil"
         "python-jsonschema"
         "python-nltk"
         "python-numpy"
         "python-scipy"
         "python-scikit-learn"
         "python-tornado"
         "python-watchdog")
makedepends=("git" "npm" "python-build" "python-installer" "python-wheel" "python-setuptools-scm")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "beancount-import"
 git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build(){
 cd "beancount-import"
 python -m build --wheel --no-isolation
}

check(){
 cd "beancount-import"
 pytest
}

package(){
 cd "beancount-import"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
