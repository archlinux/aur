# Maintainer: taotieren <admin@taotieren.com>

pkgname=freedom-studio-bin
_pkgname=FreedomStudio
pkgver=2019.05.0
_pkgver=4.7.2.2019-05-0
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://static.dev.sifive.com/dev-tools/${_pkgname}/${pkgver}/${_pkgname}-${_pkgver}-linux.gtk.${arch}.tar.gz")
noextract=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('fa3b0522febcfb1e2ca037a3969da2655857811e686bd9940e34bf6ef8036309')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/sifive/${pkgname%-bin}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/pixmaps"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/sifive/${pkgname%-bin}"

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
