# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-tade-git"
pkgver=r472.2543902
pkgrel=1
pkgdesc="A discussion/forum/link aggregator application - library only"
url="https://github.com/epilys/tade"
license=("AGPL3")
arch=("any")
provides=("python-tade" "tade")
depends=("python-django"
         "python-linkify-it-py"
         "python-markdown-it-py"
         "python-matplotlib"
         "python-pdfminer.six"
         "python-pygraphviz"
         "python-igraph"
         "python-wand")
makedepends=("python-setuptools")
source=("$pkgname::git+$url")
sha256sums=("SKIP")
options=(!strip)

pkgver(){
 cd "$pkgname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "$pkgname"
 python setup.py build
}

package(){
 cd "$pkgname"
 python setup.py install --root="$pkgdir" --optimize=1
 # remove package /usr/bin directory as manage.py must be created for each website that uses the library
 rm -r "$pkgdir/usr/bin"
}

