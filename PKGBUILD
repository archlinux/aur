# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=surfshark-wireguard-git
_pkgname=linux-surfshark-wireguard
pkgver=0.3.0.beta.r7.gbecab20
pkgrel=1
pkgdesc="Sets-up a vpn interface using wg-quick"
arch=('any')
url="https://github.com/kyndair/linux-surfshark-wireguard"
license=('MIT')
depends=('wireguard-tools' 'jq' 'curl')
provides=('surfshark-wireguard')
install=surfshark-wireguard-git.install
source=('git+https://github.com/kyndair/linux-surfshark-wireguard.git'
        'https://addons.mozilla.org/user-media/addon_icons/963/963216-64.png')
sha256sums=('SKIP'
            'df9dda0009bf36dec4caf5de47f07ad36d12fe7b96ba2faa22448f5e124bc012')

# update the package version to the current git version
pkgver() {
        cd "${srcdir}/${_pkgname}"
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    # install script and config
    install -Dm770 "${srcdir}/${_pkgname}/gen_wg_config.bash" "${pkgdir}/opt/surfshark-wireguard/gen_wg_config.sh"
    install -Dm660 "${srcdir}/${_pkgname}/config.json" "${pkgdir}/opt/surfshark-wireguard/config.json"
    # install icon
    install -Dm644 "${srcdir}/963216-64.png" "${pkgdir}/usr/share/pixmaps/surfshark-wireguard.png"
    # install readme
    install -Dm660 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/surfshark-wireguard/README.md"
    # install link
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/surfshark-wireguard/gen_wg_config.sh "${pkgdir}/usr/bin/surfshark-wireguard"
}
