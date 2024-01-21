# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=protonup-git
pkgver=0.1.5.r0.g54bcad9
pkgrel=1
pkgdesc="Install and Update Proton-GE"
arch=('any')
url="https://github.com/AUNaseef/protonup"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AUNaseef/protonup.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
