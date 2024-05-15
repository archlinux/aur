_name=7-zip
pkgname=${_name}-bin
pkgver=24.05
pkgrel=1
pkgdesc='File archiver with a high compression ratio (binary release)'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://7-zip.org/'
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'LicenseRef-UnRAR')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip')

_get_source() {
    echo -n "https://github.com/ip7z/7zip/releases/download/${pkgver}/7z${pkgver//./}-linux-${1}.tar.xz"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source x86)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('7294f7478d90d2dc122137ff64607d354c66bd45b10911359658b85ca8892118')
sha256sums_i686=('4f2a2c88290954bca8272f15d6c7a4207bab073644b2f81c358e7c631130b544')
sha256sums_aarch64=('df7bcf12eb5cb95d5ceee0206acc59d25207dae19e58af88f7fdbdc0a6dbdefc')
sha256sums_armv7h=('1b7633feb46e9d636133f38fdf5613f5fa1cc73fbfd59c8f0c653baf6f319ca6')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" \
        '7zz' '7zzs'

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        'License.txt'

    install -Dm644 -t "${pkgdir}/usr/share/doc/${_name}" \
        'History.txt' 'readme.txt'

    cp -rdt "${pkgdir}/usr/share/doc/${_name}" \
        'MANUAL'
}
