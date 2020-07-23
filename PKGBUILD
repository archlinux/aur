# Maintainer: nissen22
_pkgname=joycond-cemuhook
pkgname=${_pkgname}-git
pkgver=r34.90bbab3
pkgrel=1
pkgdesc="Support for cemuhook's UDP protocol for joycond devices"
arch=("any")
url="https://github.com/joaorb64/joycond-cemuhook"
license=("unknown")

depends=("hid-nintendo-dkms" "joycond-git" "python")
makedepends=()
conflicts=("${_pkgname}")
optdepends=('nintendo-udev: Udev rules for switch controllers')

source=("${_pkgname}::git+https://github.com/joaorb64/${_pkgname}.git" "run.sh")
sha512sums=('SKIP' '492b633a637764f52e8750e1d9e3a32c7dd39f36db379f22392dfa21a9618b254f165771a03307886dbd69287bd353e249b9d53a738f805dd117aaf436b9c0cc')


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    pwd
    install -Dm755 "../run.sh" "${pkgdir}/usr/bin/${pkgname}"
    cd "${_pkgname}"

    
    install -Dm644 "joycond-cemuhook.py" "${pkgdir}/usr/lib/${pkgname}/${pkgname}.py"
    
    install -Dm644 "Nintendo Switch Combined Joy-Cons.json" "${pkgdir}/usr/lib/${pkgname}/Nintendo Switch Combined Joy-Cons.json"
    install -Dm644 "Nintendo Switch Left Joy-Con.json" "${pkgdir}/usr/lib/${pkgname}/Nintendo Switch Left Joy-Con.json"
    install -Dm644 "Nintendo Switch Pro Controller.json" "${pkgdir}/usr/lib/${pkgname}/Nintendo Switch Pro Controller.json"
    install -Dm644 "Nintendo Switch Right Joy-Con.json" "${pkgdir}/usr/lib/${pkgname}/Nintendo Switch Right Joy-Con.json"    

    
    
    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
