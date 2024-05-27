_name=7-zip
pkgname=${_name}-bin
pkgver=24.06
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

sha256sums_x86_64=('807bd858433b13215abc915cbb9ccdc806fc7b421418a4088a194e1729a6a6b2')
sha256sums_i686=('b996c04a0bf4a31f3fc2f94e091df0afb4fe1e016cea0f4a8c205c7478c2da5a')
sha256sums_aarch64=('bc7337381e07c6ecdc872adc3636b9abd8a00a61543880777bbc3bb7acb5330d')
sha256sums_armv7h=('52f260fe2f396a0d0804f5af1b45ce0d0db45e607ed0acff8100039a5dd3dd32')

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
