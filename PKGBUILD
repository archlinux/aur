# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-studio-bin
_pkgname=FreedomStudio
pkgver=2021.04
_pkgver=4.18.0.2021-04-1
pkgrel=2
epoch=
pkgdesc="SiFive Freedom Studio RISC-V IDE for Embedded Development"
arch=('x86_64')
url="https://github.com/sifive/freedom-studio"
license=('GPL' 'GPL2' 'GPL3')
groups=('bash')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://static.dev.sifive.com/dev-tools/${_pkgname}/${pkgver}/${_pkgname}-${_pkgver}-${arch}-linux-ubuntu14.tar.gz")
noextract=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('1836380db2d9a863ef87235ca34ce2c279740ebf02a893313738763aef893a05')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/sifive/${pkgname%-bin}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/pixmaps"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/sifive/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    ln -sf "/opt/sifive/${pkgname%-bin}/FreedomStudio" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/sifive/${pkgname%-bin}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.xpm"
    install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${_pkgname}
Comment=${_pkgname} ${_pkgver}
GenericName=${_pkgname}
Exec=env GDK_BACKEND=x11 ${pkgname%-bin} %F
Icon=${pkgname%-bin}.xpm
Path=/opt/sifive/${pkgname%-bin}/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
EOF
}
