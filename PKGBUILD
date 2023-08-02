# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.1.0
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
provides=('v2raya')
conflicts=('v2raya')
backup=("etc/default/v2raya")

sha_service=87e4994a79ab26158376bbfded9c3d52ed17abed
sha_service_lite=9df9ed4266775403fcb4b655c2bc518bfe68841d
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe

source=(
    "v2raya.service"
    "v2raya-lite.service"
    "v2raya.png"
    "v2raya.desktop"
)

source_i686=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_x86_${pkgver}"
)
source_x86_64=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_x64_${pkgver}"
)
source_aarch64=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_arm64_${pkgver}"
)
source_armv6h=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_arm_${pkgver}"
)
source_armv7h=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_arm_${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_lite"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    'bfe1bda345a899f2dcf96b5b47e002a3f9962a88'
)
sha1sums_x86_64=(
    'f87a8537dbb33ea6ae64c1ad3aeefc5bd965b536'
)
sha1sums_aarch64=(
    '27dc95f3fd4217c14ff4e2abd82d13940854942f'
)
sha1sums_armv6h=(
    'b9af5abe2ede06c76f9c07fb69a32984f4835d18'
)
sha1sums_armv7h=(
    'b9af5abe2ede06c76f9c07fb69a32984f4835d18'
)

build() {
    cd "$srcdir"

    # generate default config
    cat > "$srcdir/v2raya.conf" << EOF
# v2raya config example
# Everything has defaults so you only need to uncomment things you want to
# change

EOF
    chmod +x ./v2raya_"${pkgver}"
    ./v2raya_"${pkgver}" --report config | sed '1,6d' | fold -s -w 78 | sed -E 's/^([^#].+)/# \1/'  >> "$srcdir/v2raya.conf"
}

package() {
    depends+=('v2ray>=5.0.0')

    cd "$srcdir"
    install -Dm 755 v2raya_"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya-lite.service -t "${pkgdir}"/usr/lib/systemd/user/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
    install -Dm 644 v2raya.conf "${pkgdir}"/etc/default/v2raya
}
