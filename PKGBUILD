# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="beanquery-git"
pkgver=r462.be57a79
pkgrel=1
pkgdesc="A customizable light-weight SQL query tool that works on tabular data, including Beancount"
url="https://github.com/beancount/beanquery"
license=('GPL')
arch=("any")
source=("git+$url")
b2sums=('SKIP')
provides=("beanquery")
conflicts=("beanquery")
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
 # remove environment file /etc/env
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/etc" -exec rm -rf {} +
}
