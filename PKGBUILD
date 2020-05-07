# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sockjs
pkgver='0.10.0'
pkgrel=2
pkgdesc="SockJS server implementation for aiohttp."
url="https://github.com/aio-libs/sockjs/"
depends=('python')
makedepends=('python-setuptools' 'git')
license=('Apache')
arch=('any')
source=("git+https://github.com/aio-libs/sockjs#tag=v${pkgver}"
	"race.patch::https://github.com/aio-libs/sockjs/commit/63f25ed43f281d21b9b88c79926d5258655bb8f4.patch")
sha256sums=('SKIP'
            'd524608e1271e7b3a37efe260fa034556a53a0bbaef0d6fbccfb174a32b77a90')

prepare() {
  cd "$srcdir/sockjs"
  git apply --stat "$srcdir"/*.patch
}

build() {
    cd "$srcdir/sockjs"
    python setup.py build
}

package() {
    cd "$srcdir/sockjs"
    python setup.py install --root="${pkgdir}" --optimize=1
}
