# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=ti-pru-swpkg-git
pkgver=r175.a9bff6f
pkgrel=1
pkgdesc='PRU code generation tools'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.ti.com/tool/PRU-SWPKG'
license=('custom')
makedepends=('git')
provides=('ti-pru-swpkg')

source=('git://git.ti.com/pru-software-support-package/pru-software-support-package.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/pru-software-support-package"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local installdir="${pkgdir}/opt/${pkgname/-git/}"
    mkdir -p "${installdir}/include"
    mkdir -p "${installdir}/lib"

    cd "${srcdir}/pru-software-support-package"

    cp -rv 'include/'* "${installdir}/include/"
    cp -v 'lib/rpmsg_lib.lib' "${installdir}/lib"
}
