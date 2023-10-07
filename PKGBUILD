# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=restfox
pkgname="${_app_name}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline-first web HTTP client"
arch=('x86_64')
url='https://restfox.dev'
license=('MIT')
provides=('restfox')
source=("${pkgname}-${pkgver}.deb::https://github.com/flawiddsouza/Restfox/releases/download/v${pkgver}/${_app_name}_${pkgver}_amd64.deb")
sha512sums=('00d7d8cd546a776f483b99b4b10eee5efc9486b9ed68708a1828eb22fcca2f1db5ec4c0ccc3ea71d3d09beb005becd426310bb4b6a9c0125137d4f53744bd43d')

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
