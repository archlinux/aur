# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=clamtk-gnome-git
pkgver=6.15.r0.g3c6b582
pkgrel=1
pkgdesc="A simple plugin for clamtk for the Nautilus file manager."
url="https://github.com/dave-theunsub/clamtk-gnome"
arch=('x86_64')
license=('GPL')
depends=('clamtk' 'python-nautilus')
makedepends=('git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/dave-theunsub/clamtk-gnome.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
    cd "${srcdir}/${pkgname}"

    install -m 755 -D "${pkgname%-git}.py" \
	    "${pkgdir}/usr/share/nautilus-python/extensions/${pkgname%-git}.py"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
