# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="beanquery-git"
pkgver=r411.7577b6c
pkgrel=2
pkgdesc="A customizable light-weight SQL query tool that works on tabular data, including Beancount"
url="https://github.com/beancount/beanquery"
license=('GPL')
arch=("any")
source=("git+$url")
b2sums=("SKIP")
provides=("beanquery")
depends=("beancount"
         "python-click"
         "python-tatsu")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")

pkgver(){
 cd "${pkgname/-git/}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "${pkgname/-git/}"
 python -m build --wheel --no-isolation
}

package(){
 cd "${pkgname/-git/}"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # avoid conflicts with beancount
 mv "$pkgdir/usr/bin/bean-query" "$pkgdir/usr/bin/beanquery" 
}
