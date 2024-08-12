_name=7-zip
pkgname=${_name}-bin
pkgver=24.08
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

sha256sums_x86_64=('9b3a2edf0644a2b00b0a39ab6843f426128e4a6f6f98c40f8c02a668e5b5b59b')
sha256sums_i686=('d260712a3d6535a00310fa310eae52e3c35d4e0c99c1b526fa3d9d9ac0450356')
sha256sums_aarch64=('45f467562911ceb817a47f47a39451faaae8f8686caca7898d46f1c78043be33')
sha256sums_armv7h=('4bfc54f2ec5a6ba292280a2125ebc52a59746bc91b1753888cd13881f882f9eb')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" \
        '7zz'

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        'License.txt'

    local doc="${pkgdir}/usr/share/doc/${_name}"
    install -Dm644 -t "${doc}" \
        'History.txt' 'readme.txt'

    cp -rdt "${doc}" \
        'MANUAL'
}
