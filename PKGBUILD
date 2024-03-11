# Maintainer: honjow
pkgname=sk-chos-addon
_basename=sk-chos-tool
_reponame=sk-holoiso-config
_pkgname=${pkgname}
pkgver=1.1.6
pkgrel=1
pkgdesc="Addon for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config.git"
license=('MIT')
makedepends=('git')
depends=('expect' 'efibootmgr' 'zram-generator')
provides=(sk-chos-addon)
conflicts=(sk-chos-addon-git)
replaces=(sk-chos-addon-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/honjow/sk-holoiso-config/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!strip)
backup=('etc/sk-chos-tool/github_cdn.conf')

package() {
    source_dir="${srcdir}/${_reponame}-${pkgver}/src/chimeraos-addon"

    # bin
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/bin"/*

    # conf
    install -dm755 "${pkgdir}/etc/${_basename}"
    install -m644 -t "${pkgdir}/etc/${_basename}" "${source_dir}/etc/${_basename}"/*.conf

    # fonts conf
    install -dm755 "${pkgdir}/etc/fonts/conf.d"
    install -m644 -t "${pkgdir}/etc/fonts/conf.d" "${source_dir}/etc/fonts/conf.d"/*.conf

    # sk-chos
    install -dm755 "${pkgdir}/etc/sk-chos"
    install -m644 -t "${pkgdir}/etc/sk-chos" "${source_dir}/etc/sk-chos"/*

    # sysctl
    install -dm755 "${pkgdir}/etc/sysctl.d"
    install -m644 -t "${pkgdir}/etc/sysctl.d" "${source_dir}/etc/sysctl.d"/*

    # etc systemd
    install -dm755 "${pkgdir}/etc/systemd"
    install -m644 -t "${pkgdir}/etc/systemd" "${source_dir}/etc/systemd"/*.*

    # etc system
    install -dm755 "${pkgdir}/etc/systemd/system"
    install -m644 -t "${pkgdir}/etc/systemd/system" "${source_dir}/etc/systemd/system"/*.*

    # lib service
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" "${source_dir}/systemd/system"/*.*

    # user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    install -m644 -t "${pkgdir}/usr/lib/systemd/user" "${source_dir}/systemd/user"/*
}
