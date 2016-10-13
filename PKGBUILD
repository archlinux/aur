# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dmon'
pkgver='0.4.3'
pkgrel='1'
pkgdesc='Toolset for daemonizing and supervising processes'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/aperezdc/dmon'
license=('MIT')
depends=('glibc')
makedepends=('make')
source=("git+https://github.com/aperezdc/dmon.git#tag=v${pkgver}"
        "git+https://github.com/aperezdc/wheel.git")
sha1sums=('SKIP' 'SKIP')

prepare () {
	cd dmon
	git submodule init
	git config submodule.wheel.url "${srcdir}/wheel"
	git submodule update
}

build() {
  cd dmon
  make MULTICALL=1 prefix=/usr
}

package() {
  cd dmon
  make MULTICALL=1 prefix=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgver}/README"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
