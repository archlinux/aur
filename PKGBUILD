_name=7-zip
pkgname=${_name}-bin
pkgver=24.07
pkgrel=1
pkgdesc='File archiver with a high compression ratio (binary release)'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://7-zip.org/'
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'LicenseRef-UnRAR')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

depends=('glibc')

_get_source() {
    echo -n "https://github.com/ip7z/7zip/releases/download/${pkgver}/7z${pkgver//./}-linux-${1}.tar.xz"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source x86)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('4a47877a7f6eba7fe6c900f7379bb2061b9620b588cf3189d99ae2a8aaa8f503')
sha256sums_i686=('b3e343ca66a628a64d2a86c01f794311f4fb391b42eaa975e8a030d83ca366db')
sha256sums_aarch64=('676b554713620546df56a3d4652b979a9537890d364ca2616ddd7fb270467e90')
sha256sums_armv7h=('cb73f46d3bbaadc9cca7c28b63c0385bcddda95eb6d5b00be56be3340a972176')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" \
        '7zz'

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        'License.txt'

    install -Dm644 -t "${pkgdir}/usr/share/doc/${_name}" \
        'History.txt' 'readme.txt'

    cp -rdt "${pkgdir}/usr/share/doc/${_name}" \
        'MANUAL'
}
