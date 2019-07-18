# Maintainer: zer0def <zer0def on github>
pkgname=kubedee-git
pkgver=v0.4.0.r21.35b1703
pkgrel=1
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url=https://github.com/schu/kubedee
license=('APACHE')
source=("${pkgname}::git+https://github.com/schu/kubedee")
depends=('lxd' 'btrfs-progs' 'cfssl' 'jq' 'kubectl')
provides=('kubedee')
conflicts=('kubedee')
optdepends=('kubernetes')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
    printf '%s.r%s.%s' \
        "${GITTAG}" \
        "$(git rev-list --count ${GITTAG}..)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    install -d "${pkgdir}/usr/share/kubedee"
    install -d "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/kubedee"
    install -Dm755 "kubedee" "${pkgdir}/usr/share/kubedee/kubedee"
    install -Dm644 "lib.bash" "${pkgdir}/usr/share/kubedee/lib.bash"
    ln -s ../share/kubedee/kubedee "${pkgdir}/usr/bin/kubedee"
    cp -dr --no-preserve=ownership manifests/ "${pkgdir}/usr/share/kubedee/"
}
