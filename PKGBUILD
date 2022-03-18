# Maintainer: Matthias gatto <uso.cosmo.ray at gmail dot com>
# Reference: PKGBUILD(5)

pkgname=corny-jokes-git
pkgver=r73.d3e10f1
pkgrel=1
pkgdesc='Corny Jokes for terminal'

arch=('any')
url='https://github.com/kz6fittycent/corny-jokes'

license=(MIT)

pkgver() {
  cd "${srcdir}/corny-jokes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=('python-setuptools')
depends=()

source=("git+https://github.com/kz6fittycent/corny-jokes.git")
sha256sums=("SKIP")

build() {
        cd "${srcdir}/corny-jokes"
        python ./setup.py build
}

package() {
        cd "${srcdir}/corny-jokes"
        python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D "${srcdir}/corny-jokes/LICENSE" "$pkgdir/usr/share/licenses/corny-jokes/LICENSE"
}
