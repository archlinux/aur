# Maintainer: dekart811
pkgname=vala-language-server-alpha
pkgver=1.0.4.r0.g2bdd82b
_gitver=v${pkgver}
pkgrel=1
pkgdesc='Basic Language Server for Vala primarily targeting VSCode.'
arch=('x86_64')
url="https://github.com/philippejer/vala-language-server-alpha"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
source=(git+${url}.git)
sha256sums=('SKIP')

pgkver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	git checkout tags/"${_gitver}" -b "${_gitver}"
}

build() {
	cd "${pkgname}"
	meson build --buildtype=release
	ninja -C build
}

package() {
	msg2 "package..."

	install -Dm 0755 "${srcdir}/vala-language-server-alpha/build/vala-language-server" "${pkgdir}/usr/local/bin/vala-language-server"
}
