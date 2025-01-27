# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="beanquery-git"
pkgver=r459.ba2889a
pkgrel=1
pkgdesc="A customizable light-weight SQL query tool that works on tabular data, including Beancount"
url="https://github.com/beancount/beanquery"
license=('GPL')
arch=("any")
source=("git+$url")
b2sums=('SKIP')
provides=("beanquery")
depends=("beancount"
         "python-click"
         "python-tatsu-lts")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")

pkgver(){
 cd "${pkgname/-git/}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
