# Maintainer: Mike Lei <mikelei@duck.com>
# Contributor: Hai Zhang <dreaming.in.code.zh@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=android-sdk-platform-tools-bin
pkgver=37.0.1
pkgrel=1
pkgdesc="Android platform tools (binary from Google)"
arch=("x86_64")
url="https://developer.android.com/tools"
license=("custom")
depends=("zlib" "ncurses")
provides=("adb" "android-tools")
conflicts=("adb" "android-tools")
source=(
    "https://dl.google.com/android/repository/platform-tools_r${pkgver}-linux.zip"
    "LICENSE"
)
sha1sums=(
    "477254aa5f903c15cf51001717bdf347fb6b53e0"
    "efa68a6b3c661d18699d5c026771d5911cdc2f83"
)

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/opt/android-sdk"
    install -d "${pkgdir}/usr/bin"
    cp -a "${srcdir}/platform-tools" "${pkgdir}/opt/android-sdk/platform-tools"
    ln -s "/opt/android-sdk/platform-tools/"{adb,fastboot,make_f2fs} "${pkgdir}/usr/bin"
    ln -s "/opt/android-sdk/platform-tools/mke2fs" "${pkgdir}/usr/bin/mke2fs.android"
}
