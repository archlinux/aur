# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.2.5.1
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, Tuic and Juicity protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64' 'loong64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
provides=('v2raya')
conflicts=('v2raya')
backup=("etc/default/v2raya")

sha_service=6ff514cd4e70e897d1593d08538406b0c009c3bb
sha_service_lite=661ca46bfcfc21fa455a0dfadb773a74952d52a9
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
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_armv6_${pkgver}"
)
source_armv7h=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_armv7_${pkgver}"
)
source_loong64=(
    "v2raya_${pkgver}::https://apt.v2raya.org/static/v2raya_linux_loongarch64_${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_lite"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    'c9baca18b6991492526efca8814179fb60cf9f51'
)
sha1sums_x86_64=(
    'e9d2bc196071a5614b6d8eb1b89212fda15c7980'
)
sha1sums_aarch64=(
    '93ee68ad6ce331faab934abd075b94a77630cbbc'
)
sha1sums_armv6h=(
    'db5e0db0bf870c235618ea1a0febc79e64305982'
)
sha1sums_armv7h=(
    '03dc2b77d0d4bd75ea9673e8d6632faa0b1634ad'
)
sha1sums_loong64=(
    '{{sha1sums_loong64}}'
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
