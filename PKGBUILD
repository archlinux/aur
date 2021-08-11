# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=2.1.0
_commit=ef80b844c74525219536071bab0fd5a6d19bb345
pkgrel=1
pkgdesc="A tool for writing better scripts"
arch=("any")
url="https://github.com/google/zx"
license=("Apache")
depends=("nodejs")
makedepends=("npm" "git")
source=("git+${url}#commit=${_commit}")
sha512sums=("SKIP")

build() {
	cd ${pkgname}
	npm install --production
}

package() {
	cd ${pkgname}

	local _npmdir="${pkgdir}/usr/lib/node_modules"
	install -d "${_npmdir}/${pkgname}"
	cp -r * "${_npmdir}/${pkgname}"

	local _bindir="${pkgdir}/usr/bin"
	mkdir -p "${_bindir}"
	ln -s "/usr/lib/node_modules/${pkgname}/zx.mjs" "${_bindir}/zx"

	install -Dm644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}

# vim: syntax=sh
