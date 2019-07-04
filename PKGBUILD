# Maintainer: Lev Lybin <lev.lybin at gmail dot com>
# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork
pkgver=5.2.3.763
_rawver=${pkgver//./_}
_hashver="hzp6dgwl5mhvzul3"
pkgrel=1
pkgdesc="Desktop App 64-bit Standard version"
arch=('x86_64')
url="https://www.upwork.com/downloads?source=Footer"
license=('custom')
conflicts=('upwork-alpha')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss')
install=upwork.install
source=("LICENSE" "xdg_session_type.patch")
md5sums=('bb535c74d4673cee6437b04d33b32138' 'c99eddfeb02a2dc5272b82b276b88c8a')
md5sums_x86_64=('7a17276d9a69c1e489a63de0eca5f402')
# how to get links Prod, Beta, Alpha: grep "_getVersionToDownload" ~/.Upwork/Upwork/Logs/upwork.2*.log | tail -n 1
source_x86_64=(https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb)

prepare() {
    cd "${srcdir}"
    tar -xJf "${srcdir}/data.tar.xz"
    patch -p1 --input="../xdg_session_type.patch"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
