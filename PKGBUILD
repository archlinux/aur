# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}-git
pkgver=v018.r0.ga470eeb
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
makedepends=("git")
conflicts=("${_pkgname}")

install=${_pkgname}.install
source=("${_pkgname}::git+https://github.com/nan0s7/${_pkgname}.git")
sha512sums=('SKIP')


pkgver() {
    cd "${_pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/usr/share/doc/${_pkgname}/config.example"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
