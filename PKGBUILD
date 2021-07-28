# Maintainer: nissen22
_pkgname=joycond-cemuhook
pkgname=${_pkgname}-git
pkgver=r46.857395b
pkgrel=1
pkgdesc="Support for cemuhook's UDP protocol for joycond devices"
arch=("any")
url="https://github.com/joaorb64/joycond-cemuhook"
license=("unknown")

depends=("joycond-git" "python" "python-termcolor" "python-evdev" "python-dbus-common" "python-argparse" "python-pyudev" "upower" "systemd-libs")
makedepends=("git")
conflicts=("${_pkgname}")
optdepends=('nintendo-udev: Udev rules for switch controllers', 'hid-nintendo-dkms: Kernel module with switch controller support.')

source=("${_pkgname}::git+https://github.com/joaorb64/${_pkgname}.git" "run.sh")
sha512sums=('SKIP' 'ccda550ce3daa6e5541135b81872d897b5ba1267b858a61f7e14b83829aefc91c7610fc31a83a8f0e80f56b20dfb53518b774658640b9fd0b105fe4f3c29ad57')


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}/joycond-cemuhook.py" "${pkgdir}/usr/lib/${pkgname}/${pkgname}.py"

    install -Dm644 "${srcdir}/${_pkgname}/profiles/Nintendo Switch Combined Joy-Cons.json" "${pkgdir}/usr/lib/${pkgname}/profiles/Nintendo Switch Combined Joy-Cons.json"
    install -Dm644 "${srcdir}/${_pkgname}/profiles/Nintendo Switch Left Joy-Con.json" "${pkgdir}/usr/lib/${pkgname}/profiles/Nintendo Switch Left Joy-Con.json"
    install -Dm644 "${srcdir}/${_pkgname}/profiles/Nintendo Switch Pro Controller.json" "${pkgdir}/usr/lib/${pkgname}/profiles/Nintendo Switch Pro Controller.json"
    install -Dm644 "${srcdir}/${_pkgname}/profiles/Nintendo Switch Right Joy-Con.json" "${pkgdir}/usr/lib/${pkgname}/profiles/Nintendo Switch Right Joy-Con.json"    
    
    # Probably dont need the readme
    #install -Dm644 "${srcdir}/${_pkgname}/README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
