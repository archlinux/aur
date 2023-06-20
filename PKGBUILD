_name=7-zip
pkgname=${_name}-bin
pkgver=23.01
pkgrel=1
pkgdesc="File archiver with a high compression ratio (binary release)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://7-zip.org/"
license=('LGPL')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

_get_source() {
    echo "${url}a/7z${pkgver//./}-linux-${1}.tar.xz"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source x86)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('23babcab045b78016e443f862363e4ab63c77d75bc715c0b3463f6134cbcf318')
sha256sums_i686=('a4cd3dba5dcb22d0543156258f77011a838a5402563011c2aca11c3562687857')
sha256sums_aarch64=('34e938fc4ba8ca6a835239733d9c1542ad8442cc037f43ca143a119bdf322b63')
sha256sums_armv7h=('9d67650982f819d7557c27dea748fa66ca6c04a3a1148d66716c463580b0550c')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" \
        "7zz" "7zzs"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        "License.txt"

    install -Dm644 -t "${pkgdir}/usr/share/doc/${_name}" \
        "History.txt" "readme.txt"

    cp -rdt "${pkgdir}/usr/share/doc/${_name}" \
        "MANUAL"
}
