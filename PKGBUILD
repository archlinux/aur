# Maintainer: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vlang-bin
pkgver=0.3.1
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
source=("${pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('df316dbf87c3b09d4ba23728490fc8f66b3b9ba26699faf4d779e3e132aa1c0a')
sha512sums=('7542f7e61b5ffb369daab2b13718fa7989d043931389adadcba2df33df3194cc35f5079acbe288d42ce7dfc2f4233036fae8a059adcf106e61a4b02b651df42f')

build() {
    cd v

    # Binaries for the tools are not provided with the "binary" release, so we
    # still have to build these.
    LDFLAGS='' ./v build-tools
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
