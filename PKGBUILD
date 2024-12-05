# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>
_projectname=electron
_major=32
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}-bin"
_subver='2.7'
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url='https://electronjs.org'
_ghurl="https://github.com/electron/electron"
license=(
    'MIT'
    'LicenseRef-custom'
)
provides=(
    "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'pipewire: WebRTC desktop sharing under Wayland'
    'qt6-base: enable Qt6 with --enable-features=AllowQt'
    'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
    'trash-cli: file deletion support (trash-put)'
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
source_aarch64=(
    "${_pkgname}-chromedriver-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-arm64.zip"
    "${_pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
    "${_pkgname}-chromedriver-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-armv7l.zip"
    "${_pkgname}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-armv7l.zip"
)
source_x86_64=(
    "${_pkgname}-chromedriver-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/chromedriver-v${_pkgver}-linux-x64.zip"
    "${_pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${_pkgver}/electron-v${_pkgver}-linux-x64.zip"
)
sha256sums_aarch64=('45314c8c7127f6083469c2c067aa78beb20055ba4d7a63eb2108b27e594a647a'
                    'fb6e1f24385c3058844bd768320d5b332b4cbd011ab930e7252dc330c8ee17b3')
sha256sums_armv7h=('7e976a7131dcfd55f781c073ae59c8a24a1393119d831fbac13c6a335eb71467'
                   '4a95643e88cadfb011354d25cafe242cdb8c5327d65f86b4fbabe64717367ed2')
sha256sums_x86_64=('3437feb5d8e7157476d2e7a6558346061cd7e46506874bc7870eed8a3a43642a'
                   '98007545e1d3700b32de5cb5eebcc10b9d105fb0dad6396155fdab1b40abb638')
package() {
    install -dm755 "${pkgdir}/usr/"{bin,lib/"${_pkgname}"}
    find "${srcdir}" -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/"{locales,resources} "${pkgdir}/usr/lib/${_pkgname}"
    chmod u+s "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"
    ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
}
