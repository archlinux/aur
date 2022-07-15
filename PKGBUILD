# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

# shellcheck disable=SC2034
_pkgname=fakepkg
pkgname="${_pkgname}-git"
pkgver=v1.42.0
pkgrel=1
pkgdesc="Tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache"
arch=('any')
license=('AGPL3')
url="https://github.com/Edenhofer/fakepkg"
_url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=('bash>=4.2' 'pacman' 'tar' 'gzip' 'sed' 'awk')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${_url}")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -D -m755 "${_pkgname}"       "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
