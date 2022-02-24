# Maintainer: SEGFAULT <segfault@mailbox.org>
pkgname=jackctl
pkgver=0.2
pkgrel=1
pkgdesc='A no fuss solution to wrangling Pro-Audio on Linux'
arch=('any')
url='https://gitlab.com/IGBC/jackctl'
license=('GPL3')
depends=('gtk3' 'jack2' 'libappindicator-gtk3' 'alsa-lib')
makedepends=('git' 'rust' 'gtk3' 'cmake' 'make' 'clang')
provides=('jackctl')
conflicts=('jackctl')
source=("https://gitlab.com/IGBC/jackctl/-/archive/v${pkgver}/jackctl-v${pkgver}.tar.gz")
md5sums=('d4e718fad156cb6bc4e7b427f0106f93')

build () {
    #mkdir "${srcdir}/${pkgname}"
    #tar -xf jackctl-v${pkgver}.tar.gz -C "${srcdir}/${pkgname}"
    cd "${pkgname}-v${pkgver}"
    export CARGO_HOME="$(pwd)/CARGO"
    cargo build --release
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-v${pkgver}/target/release/jackctl ${pkgdir}/usr/bin/jackctl
  install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/jackctl/LICENSE
  install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/jackctl.desktop ${pkgdir}/usr/share/applications/jackctl.desktop
  install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/res/icons/jackctl-logo.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/jackctl.svg
}
