# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=paclabel-git
_pkgname=${pkgname%-git}
pkgver=r37.09badd7
pkgrel=1
pkgdesc="A tiny pacman wrapper that makes possible to attach labels to packages."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL-3')
depends=('ncurses')
optdepends=('ripgrep')
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}/paclabel.sh" "${pkgdir}/usr/bin/paclabel"
    install -Dm644 "${srcdir}/${_pkgname}/README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 /dev/null "${pkgdir}/etc/${_pkgname}/labels"
    install -Dm644 /dev/null "${pkgdir}/etc/${_pkgname}/labels~"
}
