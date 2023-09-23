# Maintainer: dreieck
# Contributor: robertfoster

pkgname=python-soundcloud-git
pkgver=r113.e0f577a
pkgrel=2
pkgdesc="A Python wrapper around the Soundcloud API"
arch=(any)
url="https://github.com/audiobridge/soundcloud-python"
license=("BSD")
depends=(python-requests python-six python-simplejson)
makedepends=(git python-setuptools)
provides=(python-soundcloud)
conflicts=(python-soundcloud)
source=("python-soundcloud::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd python-soundcloud
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd python-soundcloud
  python setup.py build
}

package() {
  cd python-soundcloud
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
