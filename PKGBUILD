# Maintainer: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=vlang
pkgname=vlang-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software (binary release)'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
conflicts=('v' 'vlang' 'vlang-git')
provides=('vlang')
depends=('glibc')
optdepends=('glfw: Needed for graphics support'
            'freetype2: Needed for graphics support'
            'openssl: Needed for http support')
source=("${_pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('d8271520b15566fe9d08279b4bb25396f887c19ac3119ce293571c2971fa00be')
sha512sums=('0bc83ce379cbde0b211cb038e912e516013677c8a20e367b1ecee01506c96f71316a3e246ca6c3f08cc086120f711882c6084130955fe6bb082beddcdac141af')

build() {
    cd v

    # Binaries for the tools are not provided with the "binary" release, so we
    # still have to build these.
    LDFLAGS= ./v build-tools
}

package() {
    cd v

    install -d "${pkgdir}/usr/lib/vlang" "${pkgdir}/usr/share/vlang" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 v "${pkgdir}/usr/lib/vlang"
    cp -a cmd "${pkgdir}/usr/lib/vlang/"
    cp -a examples "${pkgdir}/usr/share/vlang/"
    cp -a thirdparty "${pkgdir}/usr/lib/vlang/"
    cp -a vlib "${pkgdir}/usr/lib/vlang/"
    cp v.mod "${pkgdir}/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

    touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}

# vim: ft=bash
