# Maintainer: Allddd <allddd (at) proton (dot) me>

pkgname=dracula-rofi-git
pkgver=r27.05618ac
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
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    num=1
    list=$(find ./theme/ -type f -name '*.rasi')
    for conf in ${list}; do
        install -Dm644 "${conf}" "${pkgdir}/usr/share/rofi/themes/dracula${num}.rasi"
        ((num++))
    done
}

# vim: ts=4 sw=4 et:
