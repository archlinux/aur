# Maintainer: Clarence <azzbcc@sina.com>
_pkgname=fastoredis
pkgname=${_pkgname}
pkgver=2.3.0
_build_ver=2ebd667
pkgrel=1
pkgdesc="FastoRedis, cross-platform open source Redis GUI management tool."
arch=('x86_64')
url="https://fastoredis.com/"
license=('custom')
depends=('qt5-base' 'python2')
makedepends=('rsync')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}.desktop"
        "${_pkgname}-${pkgver}-x86_64.tar.gz::https://fastoredis.com/downloads/linux/${_pkgname}-${pkgver}-x86_64.tar.gz")
md5sums=('a3da6c7bf56828a0b94e106960a41f9f'
         '5e7a7cebe1cec4f778c21aa9dd56ad01')

build() {
    echo ${_pkgname} ${pkgver}
}

package() {
    src_base_dir=${srcdir}/${_pkgname}-${pkgver}-x86_64-${_build_ver}/opt/${_pkgname}
    pkg_base_dir=${pkgdir}/opt/${_pkgname}

    install -d -m 755 "${pkg_base_dir}/share"
    install -d -m 755 "${pkgdir}/usr/share/pixmaps/"
    install -d -m 755 "${pkgdir}/usr/share/applications/"
    install -d -m 755 "${pkgdir}/usr/share/licenses/${_pkgname}/"

    rsync -rtl "${src_base_dir}/bin" "${pkg_base_dir}"
    rsync -rtl "${src_base_dir}/share/resources" "${pkg_base_dir}/share"

    install -D -m 644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    install -D -m 644 "${src_base_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -D -m 644 "${src_base_dir}/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
}
