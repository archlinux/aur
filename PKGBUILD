# Maintainer: Rene Hollander <mail@renehollander.at>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=019.2
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

backup=('etc/nfancurve.conf')
install=${_pkgname}.install
source=("${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d3327119c773e232a0f21a8390e2fd87b8f0ee741f47b5f105e8d1076317427c7bbfbbc4f3c22822fbd41b7761cb461ee1468aa49711f5c53e5561f31e92aa61')


package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/etc/nfancurve.conf"
    sed -i "s/NFANCURVE_PATH\/temp.sh/\/usr\/bin\/nfancurve -c \/etc\/nfancurve.conf/" nfancurve.service
    install -Dm644 "nfancurve.service" "$pkgdir/usr/lib/systemd/user/nfancurve.service"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
