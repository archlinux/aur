# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgbase=python-iexfinance-git
pkgname=(python-iexfinance-git python2-iexfinance-git)
pkgver=r11.d60cb4b
pkgrel=1
pkgdesc="Python wrapper for the Investor's Exchange (IEX) Developer API"
url='https://addisonlynch.github.io/iexfinance/'
arch=(any)
license=(apache)
depends=(python)
makedepends=(python-setuptools python2-setuptools)
source=("${pkgname[0]}::git+https://github.com/addisonlynch/iexfinance.git")
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname[0]}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cp -a ${pkgname[0]} ${pkgname[1]}
}

package_python-iexfinance-git() {
  cd ${pkgname[0]}
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-iexfinance-git() {
  depends=(python2)

  cd ${pkgname[1]}
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
