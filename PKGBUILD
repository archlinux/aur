# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=input-remapper-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="A tool to change and program the mapping of your input device buttons.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/sezanzeb/input-remapper/"
license=('GPL-3.0-only')
prodives=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    'key-mapper'
)
depends=(
    'python-gobject'
    'python-pydbus'
    'python-evdev'
    'gtk3'
    'python-setuptools'
    'gtksourceview4'
    'python-pydantic'
    'python-cairo'
    'python-packaging'
    'python-psutil'
)
optdepends=(
    'xorg-xmodmap: symbol names matching the keyboard layout'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('5c5adbac775578e8f98f7615f627a161822ff7ee57e40a45a7483a89cc9040fe')
build() {
	bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}.svg/${pkgname%-bin}/g" \
        {"${srcdir}/etc/xdg/autostart/${pkgname%-bin}-autoload.desktop","${srcdir}/usr/share/applications/${pkgname%-bin}-gtk.desktop"}
    rm -rf "${srcdir}/usr/local"
    mv "${srcdir}/usr/lib/python3/dist-packages" "${srcdir}/usr/lib/python3/site-packages"
    mv "${srcdir}/usr/lib/python3" "${srcdir}/usr/lib/python3.12"
}
package() {
	cp -Pr --no-preserve=ownership "${srcdir}/"{etc,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}