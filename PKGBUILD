# Maintainer: honjow
pkgname=sk-chos-addon-git
_basename=sk-chos-tool
_pkgname=sk-chos-addon
pkgver=r325.e21072d
pkgrel=1
pkgdesc="Addon for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config.git"
license=('MIT')
makedepends=('git')
depends=('expect' 'efibootmgr')
provides=(sk-chos-addon)
conflicts=(sk-chos-addon)
replaces=(sk-chos-addon)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$srcdir/sk-holoiso-config"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    source_dir="${srcdir}/sk-holoiso-config/src/chimeraos-addon"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"

    # bin
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/bin"/*

    # conf
    install -dm755 "${pkgdir}/etc/${_pkgname}"
    install -m644 -t "${pkgdir}/etc/${_pkgname}" "${source_dir}/etc/${_basename}"/*.conf

    # service
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" "${source_dir}/systemd/system"/*

    # user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    install -m644 -t "${pkgdir}/usr/lib/systemd/user" "${source_dir}/systemd/user"/*
}
