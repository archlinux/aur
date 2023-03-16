# Maintainer: Paco Pascal <me@pacopascal.com>

_pkgname='fudo'
pkgname="${_pkgname}-git"
pkgver=r2.c483344
pkgrel=1
pkgdesc='A sudo to doas wrapper'
arch=('x86_64')
url='https://github.com/FragmentedCurve/fudo'
license=('BSD')
depends=('doas')
makedepends=('git')
conflicts=("${pkgname%-git}" 'sudo')
provides=("${pkgname%-git}" 'sudo')
source=('git+https://github.com/FragmentedCurve/fudo.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${_pkgname}"
    make
}

package() {
    cd "${_pkgname}"
    install -D fudo ${pkgdir}/usr/bin/fudo
    ln -s /usr/bin/fudo ${pkgdir}/usr/bin/sudo
}
