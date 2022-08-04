# Maintainer: Rene Hollander <mail@renehollander.at>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=019.5
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia-utils" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

backup=('etc/nfancurve.conf')
install=${_pkgname}.install
source=(
  "${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz"
  "nfancurve.service"
)
sha512sums=(
  '2cfd9442ac99fde09f51d11fdb537314fa0f7313fb2baf5ba436e54471f77fc629cc3dfd0cfa0faa7ab451166db9a88fafd832af8b866615a433a254a9c7b6b3'
  SKIP
)


package() {
    install -Dm644 "nfancurve.service" "$pkgdir/usr/lib/systemd/user/nfancurve.service"

    cd "${_pkgname}-${pkgver}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/etc/nfancurve.conf"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
