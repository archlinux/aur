# Maintainer: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vlang-bin
pkgver=0.3
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
sha256sums=('826fb047658c807fafd5b48d281c9631c55e4fe8a4d156ddc4077ebcf6cf08c9')
sha512sums=('e4c732c50f0915f355f190a49a03b0fa65570e8e4bcdfc795e8e5ca3efa5bddf79b81c9b11ff4e151f3e744828b629a3667d5474a3ab2ff93d9b70216a76db5c')

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
