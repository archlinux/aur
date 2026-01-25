# Maintainer: Koen Oostveen <770grappenmaker at google mail dot com>
pkgname=elide-bin
pkgver=1.0.0_beta10
_pkgver=$(echo "$pkgver" | sed 's/_/-/g')
_majorver=v1
pkgrel=1
pkgdesc='A fast batteries-included runtime, combining support for Kotlin, JavaScript, TypeScript, and Python.'
arch=(x86_64)
url='https://elide.dev/'
license=('MIT')
options=(!strip)
depends=(bash zlib glibc gcc-libs)
optdepends=('python: if using elide python runtime'
            'java-runtime: if using elide java runtime'
            'libxrender: if using java AWT'
            'libxi: if using java AWT'
            'libxext: if using java AWT'
            'libxtst: if using java AWT'
            'libx11: if using java AWT'
            'alsa-lib: if using java Sound API'
            'freetype2: if using java AWT or fontmanager'
)
source=("${pkgname}-${pkgver}.tgz::https://elide.zip/cli/${_majorver}/snapshot/linux-amd64/${_pkgver}/elide.tgz"
        "${pkgname}-${pkgver}.tgz.asc::https://github.com/elide-dev/elide/releases/download/${_pkgver}/elide-${_pkgver}-linux-amd64.tgz.asc"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/elide-dev/elide/refs/tags/${_pkgver}/LICENSE"
)
sha512sums=('30c46eb08356cb17c7ddb725bf95a436ca3e3c22d52ad95f0dcbe0f752212f14709c739879ff7a9fbf3e1a7cf198c5bcade1121f896880ec0b66b2dddfd10480'
            'SKIP'
            'afe5930bf407d827a1d189c4746d9de1d717ebb2d8de9312baf3fb31fdaeb9c3504cd7eb6dbf29f5f53d3f4898450adac646ab0d15406b97776c7e7e1c2a3a5b')
validpgpkeys=('97E7E8439E7E29A61F97F696533E3791A7E48CE0')
package() {
        install -Dm644 "${pkgname}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        cd "elide-${_pkgver}-linux-amd64"

        install -d "$pkgdir/usr/lib/elide"
        install -d "$pkgdir/usr/bin"

        cp -r * "$pkgdir/usr/lib/elide"

        ln -s ../lib/elide/elide "$pkgdir/usr/bin/elide"

        install -d "$pkgdir/usr/share/doc/elide"
        mv "$pkgdir/usr/lib/elide/doc" "$pkgdir/usr/share/doc/elide"
}
