# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=restfox
pkgname="${_app_name}-bin"
pkgver=0.0.8
pkgrel=1
pkgdesc="Offline-first web HTTP client"
arch=('x86_64')
url='https://restfox.dev'
license=('MIT')
provides=('restfox')
source=("${pkgname}-${pkgver}.deb::https://github.com/flawiddsouza/Restfox/releases/download/v${pkgver}/${_app_name}_${pkgver}_amd64.deb")
sha512sums=('1c494362aaf2706c9dca642b339c983d0a214ef352b6ab5554dc5911c2fba35b13aa45907e594868030b6a007daf2e74375b2fb0058c7137e6f0d6a3cef317ba')

prepare() {
    tar xf "${srcdir}"/data.tar.zst
}

package() {
    local opt_dir="/opt/Restfox"

    install -d "${pkgdir}${opt_dir}" "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/"

    cp -ar usr/{bin,lib} "${pkgdir}${opt_dir}"
    rm -rf usr/share/lintian
    cp -ar usr/share "${pkgdir}/usr/"

    ln -s "${opt_dir}/bin/${_app_name}" "${pkgdir}/usr/bin/${_app_name}"
}
