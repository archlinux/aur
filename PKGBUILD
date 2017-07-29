# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="bookworm"
pkgver=0.9.0
pkgrel=1
pkgdesc="A simple user centric eBook reader which displays multiple eBooks formats uniformly"
url="https://babluboy.github.io/bookworm"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('granite' 'poppler-glib' 'python' 'unrar' 'unzip' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/babluboy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6c07113611c4fa1061f8e340ed1cc7386ac35b41fbcdc92e1a129e567c07469d')

build() {
    cd "${pkgname}-${pkgver}"
    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    cd "${pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=4 sw=2 ft=sh et:
