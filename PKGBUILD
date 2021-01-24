# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ccorn

pkgname="python-mkdocs-material-extensions-git"
pkgver=1.0.1.r2.ge2a379b
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("python-materialx" "python-mkdocs-material-extensions")
# Without "python-pip" the package is downloaded from PyPI
makedepends=("python-setuptools" "python-pip" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-material-extensions"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-material-extensions"
 python setup.py build
}

# Tests are broken
#check(){
# cd "mkdocs-material-extensions"
# python setup.py test
#}

package(){
 cd "mkdocs-material-extensions"
 python setup.py install --root="$pkgdir" --optimize=1
 install -D -m 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
 install -D -m 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
