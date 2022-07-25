# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=remindme-git
pkgdesc="Simple tool to add remind(1) task using natural language processing"
url="https://git.sr.ht/~primalmotion/remindme"
pkgver=v1.2.0.r0.g7cfef70
pkgrel=1
license=(GPL3)
arch=(any)
depends=(remind)
makedepends=(go pandoc)
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')
provides=("remindme")
conflicts=("remindme")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	make remindme
	make man
}

package() {
	# install -Dm755 ${srcdir}/${pkgname}/remindme ${pkgdir}/usr/bin/remindme
	cd "${srcdir}/${pkgname}"
	PREFIX=${pkgdir}/usr make install
}
