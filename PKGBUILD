# Maintainer: kd8bny <kd8bny at gmail dot com>

pkgname=katalogue-git
pkgver=r1.d310f81
pkgrel=1
pkgdesc="Catalog to track maintenance events and todos for your home, car, and otherwise"
arch=('x86_64')
license=('AGPLv3')
url="https://github.com/kd8bny/katalogue"
depends=(cmake)
source=(
  "${pkgname}::git+https://github.com/kd8bny/katalogue"
)
sha512sums=(SKIP)

_exec_name="katalogue"
_desktop_file="katalogue.desktop"
_release_name="katalogue"
_install_path="/opt/${pkgname}/"

build(){
  cd ${pkgname}
  cmake -B build/ . && cmake --build build/
}

package() {
    # Install sources in /opt
    mkdir -p "${pkgdir}/${_install_path}"
    cp ${pkgname}/build/bin/${_exec_name} "${pkgdir}/${_install_path}"

    # Link to exec
    mkdir -p "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}${_exec_name}" "${pkgdir}/usr/bin/${_exec_name}"

    # Install .desktop
    ls
    pwd
    install -Dm644 "${pkgname}/${_desktop_file}" "${pkgdir}/usr/share/applications/${_desktop_file}"

    # # # Install icons
    # # install -Dm644 "..${_desktop_file}" "${pkgdir}/usr/share/applications/${pkgname}"

    # # Install License
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
