# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=diun

pkgname=diun-bin
pkgver=4.26.0
pkgrel=3
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun')
provides=('diun')
license=('MIT')
source=("${_pkggit}-${pkgver}_linux_amd64.tar.gz::https://github.com/crazy-max/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.tar.gz"
        "diun.service::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.service"
        "diun.yml::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.yml")
sha256sums=('b8cfc7e6fece0c88c49b661663abfd358ff84475fd6506cca3b3c7571a48b9e8'
            '5c16f7ae5b023407a443fbf1d0d811d236c94d191aae1af426e9540d22df3fa7'
            '00436d3e95e446211f9ffbaa36e6b9bc27ffe054745f1a687c4c1c46f1d7da14')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 diun.service ${pkgdir}/etc/systemd/system/diun.service
  install -Dm644 diun.yml ${pkgdir}/etc/diun/diun.yml
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}

post_install() {
    echo 'Default configuration file `/etc/diun/diun.yml` is included in this package.'
    echo 'You must modify it with you own configuration following the Diun documentation.'
    echo 'See https://crazymax.dev/diun/config/ for more details.'
    echo ''
    echo 'Once the configuration is in place, you can start the Diun system'
    echo 'service or enable it to run on boot like with any other service, e.g.'
    echo '# systemctl enable --now diun.service'
}
