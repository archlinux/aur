# Maintainer: honjow
pkgname=sk-chos-addon
_basename=sk-chos-tool
_reponame=sk-holoiso-config
pkgver=1.0.4
pkgrel=1
pkgdesc="Addon for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config.git"
license=('MIT')
makedepends=('git')
depends=('expect' 'efibootmgr')
provides=(sk-chos-addon)
conflicts=(sk-chos-addon-git)
replaces=(sk-chos-addon-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/honjow/sk-holoiso-config/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!strip)
backup=('etc/sk-chos-tool/github_cdn.conf')

package() {
    source_dir="${srcdir}/${_reponame}-${pkgver}/src/chimeraos-addon"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"

    # bin
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/bin"/*

    # conf
    install -dm755 "${pkgdir}/etc/${pkgname}"
    install -m644 -t "${pkgdir}/etc/${pkgname}" "${source_dir}/etc/${_basename}"/*.conf

    # service
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system" "${source_dir}/systemd/system"/*

    # user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    install -m644 -t "${pkgdir}/usr/lib/systemd/user" "${source_dir}/systemd/user"/*

}
