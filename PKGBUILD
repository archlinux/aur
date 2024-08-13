# Maintainer: Harry Youd <harry at youd dot family>
pkgname=m3u-filter-bin
_realpkgname=m3u-filter
pkgver=2.0.3
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/euzu/${_realpkgname}"
license=('MIT')
provides=('m3u-filter')
conflicts=('m3u-filter')
backup=("etc/m3u-filter/api-proxy.yml"
        "etc/m3u-filter/config.yml"
        "etc/m3u-filter/source.yml"
        "etc/m3u-filter/mapping.yml")
source=("${_realpkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_realpkgname}_v${pkgver}_linux_${arch}.tgz"
        "${_realpkgname}.service"
        "${_realpkgname}.sysusers"
        "${_realpkgname}.tmpfiles")
sha256sums=('4bf4110b13948240298dfa275b32198f61cb262aafaccf327fa4c8f7750a455a'
            'b29b853ac4fd75083c65a743d7e3880f6aeb212e82fd10113b490ab0cec7eec4'
            '9999d2cc2d9dfdb612aa43770b0db258c51deca42e02be835951e2ce32aeafca'
            '8dbae83347f65360c92d9adb84073be2963c33bce16fbe5adeab369cc5cb3a30')


package() {
    install -Dm644 "${_realpkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${_realpkgname}.service"
    install -Dm644 "${_realpkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${_realpkgname}.conf"
    install -Dm644 "${_realpkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${_realpkgname}.conf"

    cd "${_realpkgname}_v${pkgver}_linux_${arch}"

    install -dm755                           "${pkgdir}/etc/m3u-filter"
    install -Dm644 "api-proxy.yml"           "${pkgdir}/etc/m3u-filter/api-proxy.yml"
    install -Dm644 "config.yml"              "${pkgdir}/etc/m3u-filter/config.yml"
    install -Dm644 "source.yml"              "${pkgdir}/etc/m3u-filter/source.yml"
    install -Dm644 "mapping.yml"             "${pkgdir}/etc/m3u-filter/mapping.yml"

    install -Dm755 "${_realpkgname}"              "${pkgdir}/usr/bin/${_realpkgname}"

    install -dm755                           "${pkgdir}/usr/share/${_realpkgname}/"
    cp -R web                                "${pkgdir}/usr/share/${_realpkgname}/"
    find "${pkgdir}/usr/share/${_realpkgname}/" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/share/${_realpkgname}/" -type d -exec chmod 755 {} \;
}
