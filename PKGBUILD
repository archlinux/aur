# Maintainer: aic0d3r <funforfreeapps@gmail.com>
_pkgbase=z13-backlight-quirk
pkgname=z13-backlight-quirk-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc='Lower minimum screen brightness for the 2025 ASUS ROG Flow Z13 (GZ302) via a DRM panel backlight quirk (DKMS)'
arch=('any')
url='https://github.com/aic0d3r/z13-backlight-quirk'
license=('GPL-2.0-only')
depends=('dkms')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7dea81abf4eab05d2cec8939383db6c3e3ae209e1ab5afde42e7ae77a4ca1e0b')

package() {
    cd "${_pkgbase}-${pkgver}"
    local dest="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -Dm644 drm_panel_backlight_quirks.c Kbuild Makefile dkms.conf -t "${dest}/"
    sed -i "s/@PKGVER@/${pkgver}/" "${dest}/dkms.conf"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
