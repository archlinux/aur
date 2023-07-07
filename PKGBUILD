# Maintainer: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=vlang
pkgname=vlang-bin
pkgver=0.4
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
sha256sums=('c4ed10a874686dcc2479b793537fb4c59d0fe764ff34f4750df4d660754809b0')
sha512sums=('2e19b01dfe938209b70de52e3226c5d1fb64c5f925131ecd442cc7ad4a244360c6c8bfaa4b6d46c7538b9b0f5cf0f75e48e9b3798268f9fce140f207934f02a8')

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
