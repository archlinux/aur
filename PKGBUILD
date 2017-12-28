# Maintainer: Rafał Frączek <rafalfr@protonmail.ch>
pkgname=smarttrafficmeter
pkgver=2.1.1230.6885
pkgrel=1
pkgdesc="Software for measuring network usage."
arch=('x86_64')
url="https://github.com/rafalfr/smarttrafficmeter"
license=('GPL3')
depends=('boost-libs' 'curl')
makedepends=('gcc' 'git' 'boost' 'curl' 'binutils' 'gzip')
checkdepends=()
optdepends=()
provides=('smarttrafficmeter')
conflicts=()
replaces=()
backup=()
options=()
install='smarttrafficmeter.install'
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

build() {
    git clone --depth 1 "https://github.com/rafalfr/smarttrafficmeter.git"
    cd ${srcdir}/smarttrafficmeter/
    make -f SmartTrafficMeter.cbp.mak linux_release
}

package() {
    install -D -m755 ${srcdir}/smarttrafficmeter/bin/Release/smarttrafficmeter ${pkgdir}/usr/bin/smarttrafficmeter
    install -D -m755 ${srcdir}/smarttrafficmeter/install/arch/smarttrafficmeter.service ${pkgdir}/usr/lib/systemd/system/smarttrafficmeter.service
    install -D -m755 ${srcdir}/smarttrafficmeter/man/smarttrafficmeter.1 ${pkgdir}/usr/share/man/man1/smarttrafficmeter.1
    gzip /usr/share/man/man1/smarttrafficmeter.1
 }
