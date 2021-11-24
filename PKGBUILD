# Maintainer: Shayne Hartford <shaybox@shaybox.com>

_pkgname=pinecil-firmware-updater
pkgname="${_pkgname}-git"
pkgver=r21.1b111e0
pkgrel=1
pkgdesc="Application for updating Pinecil soldering iron"
url="https://github.com/pine64/${_pkgname}"
arch=('any')
license=('Apache')
provides=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')
depends=('dfu-util')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	qmake
	make
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "pinecil_firmware_updater" "${pkgdir}/usr/bin/${_pkgname}"
}
