_name=7-zip
pkgname=${_name}-bin
pkgver=24.09
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

sha256sums_x86_64=('914c7e20ad5ef8e4d3cf08620ff8894b28fe11b7eb99809d6930870fbe48a281')
sha256sums_i686=('cb5e49caaf761df67add54729553bef89a38071b0c455461452578018625fee5')
sha256sums_aarch64=('fbe331697c9417bbc06fc92d3f4576dca6a5a1442fad7ae810304446a9153e2c')
sha256sums_armv7h=('ea446c3843a468155da8313fa99eac9264305ed75d3b3ff0fa91dee07a665da2')

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
