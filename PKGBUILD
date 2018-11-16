# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=git-pw-git
pkgver=1.5.0.1+ged39855379
pkgrel=1
pkgdesc="Git integration for Patchwork, the web-based patch tracking system"
arch=(any)
url="https://github.com/getpatchwork/git-pw"
license=(MIT)
source=("git+$url")
sha256sums=(SKIP)
depends=(python python-{pbr,click,requests,tabulate,arrow})
makedepends=(python-setuptools)
conflicts=(git-pw)
provides=("git-pw=${pkgver%+*}")

pkgver() {
  cd git-pw
  git describe --long --abbrev=10 | sed 's/-/./; s/-/+/; s/-/./'
}

build() {
  cd git-pw
  python setup.py build
}

package() {
  cd git-pw
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
