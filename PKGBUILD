# Maintainer: Matthias gatto <uso.cosmo.ray at gmail dot com>
# Reference: PKGBUILD(5)

pkgname=whatami-git
pkgver=r30.5b49380
pkgrel=1
pkgdesc='Get ready for some painful insults...'

arch=('any')
url='https://github.com/kz6fittycent/whatami'

license=(MIT)

pkgver() {
  cd "${srcdir}/whatami"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=('python-setuptools')
depends=()

source=("git+https://github.com/kz6fittycent/whatami.git")
sha256sums=("SKIP")

build() {
        cd "${srcdir}/whatami"
        python ./setup.py build
}

package() {
        cd "${srcdir}/whatami"
        python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D "${srcdir}/whatami/LICENSE" "$pkgdir/usr/share/licenses/whatami/LICENSE"
}
