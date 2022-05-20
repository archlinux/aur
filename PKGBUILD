# Maintainer: Cass Spencer <cass.spencer.aur at gmail dot com>

pkgname=xtermwm-git
pkgver=0.4.0
pkgrel=1
pkgdesc="A text-based window manager"
arch=('any')
url="https://gitlab.com/AutumnMeowMeow/xtermwm"
license=('MIT')
depends=('java-runtime' 'bash' 'glibc')
makedepends=('jdk-openjdk' 'ant' 'git')
optdepends=('inetutils: server-client support')
provides=('xtwm' 'ptypipe')
conflicts=('xtwm' 'xtermwm' 'ptypipe')
source=("git+https://gitlab.com/AutumnMeowMeow/xtermwm.git")
md5sums=(SKIP)

prepare() {
    cd "${srcdir}/xtermwm"
    ./autogen.sh
}

build() {
    cd "${srcdir}/xtermwm"
    make
}

package() {
    cd "${srcdir}/xtermwm"
    install -Dm755 bin/xtwm "${pkgdir}/usr/bin/xtwm"
    install -Dm644 docs/xtwm.1 "${pkgdir}/usr/share/man/man1/xtwm.1"
    install -Dm644 java/build/jar/xtwm.jar "${pkgdir}/usr/share/java/xtwm.jar"
    install -Dm755 lib/ptypipe/ptypipe "${pkgdir}/usr/bin/ptypipe"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/xtermwm-git/LICENSE"
}
