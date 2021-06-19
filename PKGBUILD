# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Carl George < arch at cgtx dot us >

pkgname="python-mkdocs"
pkgver=1.2.1
pkgrel=3
pkgdesc="Project documentation with Markdown"
url="https://www.mkdocs.org"
license=("BSD")
arch=("any")
provides=("mkdocs")
conflicts=("mkdocs")
depends=("python-babel"
         "python-click"
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
source=("https://github.com/mkdocs/mkdocs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("4b134ce568f5c6b5ffa80f432b9e7f548a3f33b5fb8033257eb15d17655c22a3")

prepare(){
 # the package wants 2.0, but repo (and pypi) use 0.10
 cd "mkdocs-$pkgver"
 sed -i "setup.py" \
     -e "s/'watchdog>=2.0',/'watchdog',/"
}

build(){
 cd "mkdocs-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs-$pkgver"
 python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
