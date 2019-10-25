# Maintainer: Rene Hollander <mail@renehollander.at>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=019
pkgrel=2
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

backup=('etc/nfancurve.conf')
install=${_pkgname}.install
source=("${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('17f792781cafaaed19de147ecea7e7ba857650d45a7a061b5982b3a2133c1d1f858630c7bd001a3c1dd7e4e052492e3b42cdc852e22c0d56904a07755b6d45a1')


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
