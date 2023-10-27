# Maintainer: Hoream <hoream@qq.com>
_pkgname="fcitx5-skin-marisa"
pkgname="${_pkgname}-git"
pkgver=r4.15d5403
pkgrel=3
pkgdesc='Fcitx Marisa Skin'
url='https://github.com/xiaohuirong/fcitx5-skin-marisa.git'
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("fcitx5")
makedepends=('git')
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	install -d ${pkgdir}/usr/share/fcitx5/themes/${_pkgname}
	cp ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/fcitx5/themes/${_pkgname} -ra
    rm ${pkgdir}/usr/share/fcitx5/themes/${_pkgname}/preview.png
}
