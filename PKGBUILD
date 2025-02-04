# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-portfolio-returns-git"
pkgver=r63.e5dc9cf
pkgrel=2
pkgdesc="Show portfolio returns in Fava"
url="https://github.com/andreasgerstmayr/fava-portfolio-returns"
license=("GPL3")
arch=("any")
depends=(    "fava"
             "beangrow"
             "python-scipy"
             "python-matplotlib")
makedepends=("npm"
             "esbuild"
             "git"
             "python-build"
             "python-installer"
             "python-hatchling"
             "python-hatch-vcs"
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
 cd "frontend"
 npm install
 npm run build
}

package(){
 cd "fava-portfolio-returns"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
