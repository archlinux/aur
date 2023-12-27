# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-portfolio-returns-git"
pkgver=r34.796f680
pkgrel=1
pkgdesc="Show portfolio returns in Fava"
url="https://github.com/andreasgerstmayr/fava-portfolio-returns"
license=("GPL3")
arch=("any")
depends=(    "fava"
             "beangrow")
makedepends=("npm"
             "esbuild"
             "git"
             "python-build"
             "python-installer"
             "python-setuptools-scm"
             "python-wheel")
options=("!strip")
source=("git+$url")
b2sums=("SKIP")

pkgver() {
 cd "fava-portfolio-returns"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
 cd "fava-portfolio-returns"
 python -m build --wheel --no-isolation
 npm install echarts
 make build
}

package(){
 cd "fava-portfolio-returns"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
