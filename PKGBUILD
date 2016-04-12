# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=ssync
pkgver='1.0.2'
pkgrel=1
pkgdesc='ssync (system sync) is a symlinking git wrapper for [config] files.'
arch=(any)
url="https://github.com/n2code/${pkgname}"
license=('MIT')
depends=('git>=2.0.0' 'rsync>=3.0.0' 'coreutils' 'bash>=4.0.0')
source=("${pkgname}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(e6e49d9cba2c7bab2160724ecc1685e72b5501c9da8eb332c145ac5634866362)
backup=("etc/${pkgname}.conf")

package() {
    extracted_src="${srcdir}/${pkgname}-${pkgver}"
    cp -dpr --no-preserve=ownership "${extracted_src}/usr" "${pkgdir}"

    licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    cp -p --no-preserve=ownership "${extracted_src}/LICENSE" "$licensedir"

    install -dm755 "${pkgdir}/etc"
    cp -p --no-preserve=ownership "${extracted_src}/usr/share/${pkgname}/${pkgname}.conf.template" \
                                  "${pkgdir}/etc/${pkgname}.conf"

    libdir="${pkgdir}/var/lib"
    install -dm755 "$libdir"
    repodir="${libdir}/${pkgname}"
    install -dm711 "$repodir"
}
