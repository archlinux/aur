# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

_themename=google
pkgname=lightdm-webkit-theme-${_themename}-git
pkgver=r11.d83ee55
pkgrel=1
pkgdesc="Google/ChromeOS style LightDM Webkit greeter theme"
arch=('any')
url="https://github.com/omgmog/lightdm-webkit-google"
license=('custom:WTFPL')
depends=('lightdm' 'lightdm-webkit-greeter')
source=("${pkgname}::git+https://github.com/omgmog/lightdm-webkit-google.git"
        'LICENSE')
md5sums=('SKIP'
         'e6f431dd1ad48a375db96aeb94d1916e')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${srcdir}/${pkgname}"
}

package () {
	cd "${srcdir}/${pkgname}"

    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -d "${pkgdir}/usr/share/lightdm-webkit/themes"
    cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}" "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}"
    rm -rf "${pkgdir}/usr/share/lightdm-webkit/themes/${_themename}/.git"
}
