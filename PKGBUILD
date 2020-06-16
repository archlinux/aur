# Maintainer: Danilo Luvizotto <danilo.luvizotto@gmail.com>

pkgname=systemd-wireguard-refresh-git
pkgver=r4.6e75115
pkgrel=2
pkgdesc="A script and configuration files to refresh Wireguard endpoints periodically (or not)"
license=('AGPL')
arch=('any')
conflicts=('systemd-wireguard-refresh')
provides=('systemd-wireguard-refresh')
makedepends=(git)
source=('git+https://github.com/pvcbe/systemd-wireguard-refresh.git')
md5sums=(SKIP)

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}"
    cd "${pkgdir}"

    local bin_dir="usr/bin"
    local systemd_service_dir="usr/lib/systemd/system"
    local src_dir="../../src/${pkgname%-git}"

    mkdir -p "${bin_dir}"
    mkdir -p "${systemd_service_dir}"

    chmod +x "${src_dir}/reresolve-dns-systemd.sh"
    cp "${src_dir}/reresolve-dns-systemd.sh" "${bin_dir}"
    cp "../../reresolve-dns-systemd.service" "${systemd_service_dir}"
    cp "../../reresolve-dns-systemd.timer" "${systemd_service_dir}"
}

