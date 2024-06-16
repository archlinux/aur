# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=dracula-rofi-git
pkgver=r29.459eee3
pkgrel=1
pkgdesc='Dark theme for Rofi'
arch=('any')
url='https://draculatheme.com/rofi'
license=('MIT')
makedepends=('git')
optdepends=('rofi')
source=("${pkgname}::git+https://github.com/dracula/rofi.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    local NUM=1
    for CONF in $(find ./theme/ -type f -name '*.rasi'); do
        install -Dm644 "${CONF}" "${pkgdir}/usr/share/rofi/themes/dracula${NUM}.rasi"
        ((NUM++))
    done
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=4 sw=4 et:
