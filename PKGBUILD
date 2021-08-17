# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="mkdocs"
pkgver=1.2.2
pkgrel=2
pkgdesc="Project documentation with Markdown"
url="https://www.mkdocs.org"
license=("BSD")
arch=("any")
provides=("mkdocs")
conflicts=("python-mkdocs")
depends=("python-babel"
         "python-click"
         "python-dateutil"
         "python-ghp-import"
         "python-jinja"
         "python-importlib-metadata"
         "python-livereload"
         "python-markdown"
         "python-markupsafe"
         "python-mergedeep"
         "python-mdx-gh-links"
         "python-packaging"
         "python-pyyaml-env-tag"
         "python-yaml"
         "python-watchdog")
makedepends=("python-setuptools")
optdepends=("python-lunr: to prebuild search index")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("998cbf9f7933a5b769824e520c92d42c1e4b54285ee49a7dcc1e618bfdf56131")

prepare(){
 # the package wants 2.0, but repo (and pypi) use 0.10
 cd "$pkgname-$pkgver"
 sed -i "setup.py" \
     -e "s/'watchdog>=2.0',/'watchdog',/"
}

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
