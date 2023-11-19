# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=gg-bin
pkgver=0.2.18
pkgrel=2
pkgdesc='A command-line tool for one-click proxy in your research and development without installing v2ray or anything else (only for linux). (Precompiled version)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/mzz2017/gg'
license=('AGPL-3.0')
conflicts=('gg')
provides=('gg')
optdepends=('libcap')
options=('!strip')

source=('gg-cap'
        'gg.hook'
        'gg-bash'
        'gg-zsh'
        'gg.fish')
source_x86_64=("${url}/releases/download/v${pkgver}/gg-linux-x86_64")
source_aarch64=("${url}/releases/download/v${pkgver}/gg-linux-arm64")
source_armv7h=("${url}/releases/download/v${pkgver}/gg-linux-armv7")

sha256sums=('d1c4f10188f1180b907309e321ef2cb3a5a61e09ac2543809b226c6e40c8e433'
            '7cec4ef2c0681366ec729e673db0411e69da5b08b8d23da7628bd6bac3a233cc'
            'd13d8ccc9176e3fd990eee93452d4abbd277fb9b758e61efbada4692ec4cf260'
            'd38b2d0fd493547794ba2f8c6c5686c630869f022b507347fbc7bd68092b4924'
            '16fb429f593e99d98ea61f7e108826e253ca82c65ec351e2c07d3cd97de5a72f')
sha256sums_x86_64=('2e8bf15fd00185600cc952f1c35ce24ace67b2fb95de8a3c619409b1a50dcad8')
sha256sums_aarch64=('00130a5fe5e75333da18d67164debdd023d2bd01387a43b84581946dfe831b15')
sha256sums_armv7h=('97e87b0afae12af09a77697013b19c49c5cb0c4f9f3595e433c449c1f9de33dd')

declare -A _archmap=(
    ['x86_64']='x86_64'
    ['aarch64']='arm64'
    ['armv7h']='armv7'
)

_arch="${_archmap[${CARCH}]}"

package() {
    cd "${srcdir}"
    install -Dm 755 gg-linux-${_arch} "${pkgdir}/usr/bin/gg"
    install -Dm 644 gg-bash "${pkgdir}/usr/share/bash-completion/completions/gg"
    install -Dm 644 gg-zsh "${pkgdir}/usr/share/zsh/site-functions/_gg"
    install -Dm 644 gg.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"

    # setcap for gg
    install -Dm 644 gg.hook -t "${pkgdir}/usr/share/libalpm/hooks"
    install -Dm 755 gg-cap -t "${pkgdir}/usr/share/libalpm/scripts"
}
