# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_gitname=radpro
_pkgbase=radpro-tool
pkgname=${_pkgbase}-git
pkgver=r583.0275cb3
pkgrel=1
pkgdesc="Tool for low-level access to dosimeters running the Rad Pro custom firmware (git version)"
arch=('any')
url="https://github.com/Gissio/${_gitname}"
license=('MIT')
depends=('python-pyserial' 'python-requests')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"

	sed -i '1i #!/usr/bin/env python3' 'tools/radpro-tool.py'
}

package() {
	cd "${srcdir}/${_gitname}"

	install -Dm755 'tools/radpro-tool.py' "${pkgdir}/usr/bin/radpro-tool"
}
