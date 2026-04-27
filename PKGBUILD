# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openixsuit-bin
pkgname=openixsuit-bin
_pkgname=OpenixSuit
pkgver=0.4.6
pkgrel=1
arch=('x86_64')
_name=${_pkgname}_${pkgver}_amd64
options=(!strip !debug)
depends=(
    cairo
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libgcc
    libsoup3
    libusb
    webkit2gtk-4.1
)
makedepends=(libarchive)
optdepends=(
    "openiximg: A comprehensive toolset for handling Allwinner IMAGEWTY format firmware images"
    "openixcli: Open Source CLI Tools for Flash Allwinner Firmware to Devices"
)
provides=(${pkgname%-bin} openixcard sunxi-livesuite)
conflicts=(${pkgname%-bin} openixcard sunxi-livesuite)
replaces=(sunxi-livesuite)
pkgdesc="Tools to Flash Allwinner Firmware to Devices like PhoenixSuit and LiveSuit"
license=('LicenseRef-scancode-commercial-license')
url="https://github.com/YuzukiTsuru/OpenixSuit"
install=${pkgname}.install
source=("${url}/releases/download/v${pkgver}/${_name}.deb"
    ${pkgname}.install)
sha256sums=('35f8481cc0afb19cbd764dc56b8e4b42e8ef478028db0c1fcd82cc641a3f9da6'
            '763f59e338643858260b27c93c510541616de1f81f4b7946c9dc81116bbba33f')
# noextract=()

# prepare() {
#     mkdir -pv ${srcdir}/${pkgname}-${pkgver}
#     bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
# }

package() {
    # cd ${srcdir}/${_name}
    bsdtar -xf "${srcdir}/data.tar.gz" --numeric-owner -C "${pkgdir}/"
    # install -Dm644 license -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-openixsuit.rules" << EOF
ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="1f3a", ATTRS{idProduct}=="efe8", MODE="666", GROUP="uucp", TAG+="uaccess", ATTR{power/autosuspend}="-1"
EOF
}
