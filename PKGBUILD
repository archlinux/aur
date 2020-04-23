# Maintainer: Alexey Andreyev <aa13q.ru>

pkgname=('python-gitim-git')
_module='gitim'
pkgver=1.0.r26.g105426b
pkgrel=1
pkgdesc="Clone all of your Github repositories, just single command from your terminal"
url="https://github.com/muhasturk/gitim"
depends=('python' 'python-pygithub')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${_module}-${pkgver}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_module}-${pkgver}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
