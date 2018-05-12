# Maintainer: Florian Benscheidt <gn0mish@protonmail.com>

pkgname=("python-geocoder" "python2-geocoder")
pkgbase="python-geocoder"
pkgver=r1248.b4375d1
pkgrel=1
pkgdesc="Simple and consistent geocoding library written in Python."
arch=("any")
_giturl="github.com/DenisCarriere/geocoder"
url="https://${_giturl}"
license=("custom")
source=("$pkgbase-$pkgver::git://${_giturl}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
  python2 setup.py build
}

package_python-geocoder() {
  depends=("python-click" "flake8" "python-nose" "python-tox" "python-requests" "python-six" "python-future")
  makedepends=("python" "python-setuptools")
  provides=("${pkgbase}")

  pip install --user "ratelim>=0.1.6" #ratelim not in aur or base repo
  
  cd "$pkgbase-$pkgver"
  python setup.py install --root="${pkgdir}"
}

package_python2-geocoder() {
  depends=("python2-click" "python2-flake8" "python2-nose" "python2-tox" "python2-requests" "python2-six" "python2-future")
  makedepends=("python2" "python2-setuptools")
  provides=("${pkgbase}")

  pip2 install --user "ratelim>=0.1.6"

  cd "$pkgbase-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}
