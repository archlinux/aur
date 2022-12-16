# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=protonup-git
pkgver=0.1.4.r9.gd8289b0
pkgrel=1
pkgdesc="Install and Update Proton-GE"
arch=('any')
url="https://github.com/AUNaseef/protonup"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AUNaseef/protonup.git'
        'https://github.com/AUNaseef/protonup/pull/26.patch')
sha256sums=('SKIP'
            'a4a2a4ea02d5457010994645a61e6c43cddaff33096a6f8ec6c2189898ddfed5')

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -Np1 -i ../26.patch
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
