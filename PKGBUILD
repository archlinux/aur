# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ccorn

pkgname="python-mkdocs-material-extensions-git"
pkgver=1.0b1.r0.g0f120b8
# As of 2020-12-03, the latest, non working commit is 8e530fe61daaeca4c53eec5ee84b3b744830cbae
# Latest working commit, corresponding to release 1.0b1
_commit=0f120b8d472ca61fd9dd758f1428c603785dfe33
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("python-materialx" "python-mkdocs-material-extensions")
depends=("mkdocs-material>=5.0.0")
# Without "python-pip" the package is downloaded from PyPI
makedepends=("python-setuptools" "python-pip" "python-wheel")
# Using known commit instead of the latest available
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
#source=("git+$url")
sha256sums=("fc94e8369b295c0fabf8b9c6cfbca8fa1669678e26f91e836497786025e3e356")

# The function pkgver() doesn't work with a tar.gz package
#pkgver(){
# git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
#}

prepare(){
 mv "mkdocs-material-extensions-$_commit" "$pkgname"
 cd "$pkgname"
 # Replacing version 1.0b1 with 1.0 to ensure compatibility
 sed -i "s/version=VER,/version=1.0,/" "setup.py"
}

build(){
 cd "$pkgname"
 python setup.py build
}

# Tests are broken
#check(){
# cd "mkdocs-material-extensions-$pkgver"
# python setup.py test
#}

package(){
 cd "$pkgname"
 python setup.py install --root="$pkgdir" --optimize=1
 install -D -m 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
 install -D -m 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
