# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>

pkgname=sif-git
_name=SIF
pkgver=r92.a38c47e
pkgrel=1
pkgdesc="Steam Icons Fixer - Fix runtime icons of Steam games on Linux."
url="https://github.com/BlueManCZ/SIF"
arch=('any')
license=('Apache')
makedepends=('git')
depends=('xdotool' 'python-gobject' 'python-requests' 'python-vdf')
source=("git+https://github.com/BlueManCZ/SIF")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
	cd "${srcdir}/$_name"
	install -Dm644 database.json "${pkgdir}/usr/share/${_name}/database.json"
	install -Dm755 sif.py "${pkgdir}/usr/share/${_name}/sif.py"
	install -Dm755 fix-wm-class.sh "${pkgdir}/usr/share/${_name}/fix-wm-class.sh"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_name}/sif.py" "${pkgdir}/usr/bin/sif"
}
