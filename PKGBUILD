# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.2.4.7
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
    '3ba81216f94b990ea8c75ab3098d9fd0fe660ab5'
)
sha1sums_x86_64=(
    '92481db277f58168bf7e0f511a56209f41fbf251'
)
sha1sums_aarch64=(
    '3bc8cb8afb21acb8026f20a647a97e079ba866bc'
)
sha1sums_armv6h=(
    'da176c8e992368dc54b49b8a1ed967b5fabe910c'
)
sha1sums_armv7h=(
    '6894b5c9a1f95f210bb3aa605aae25074c752947'
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
