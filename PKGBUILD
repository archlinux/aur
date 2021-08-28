# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=xpytile-git
pkgver=r22.6c202df
pkgrel=1
pkgdesc="Tiling and simultaneous resizing of side-by-side windows (not only) for Xfce."
arch=('any')
url="https://github.com/jaywilkas/xpytile/"
license=('GPL3')
depends=('python' 'python-xlib' 'libnotify')
source=("${pkgname}::git+https://github.com/jaywilkas/xpytile/")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
	cd "${pkgname}"
	install -Dm755 "xpytile.py" "${pkgdir}/usr/bin/xpytile"
    install -Dm644 "xpytilerc" "${pkgdir}/etc/xpytilerc"
}
