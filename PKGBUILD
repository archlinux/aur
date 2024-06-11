# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Co-Maintainer: Martin Rys <rys.pw/contact>
# PKGBUILD that builds package from git.
# Run 'makepkg -i' and hope for best :)

pkgname=sc-controller-git
pkgver=0.4.8.14.r0.ccde45f
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'python-vdf' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'scc')
source=('sc-controller'::'git+https://github.com/C0rn3j/sc-controller.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
