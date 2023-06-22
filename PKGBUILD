# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-anaphora
pkgver=1.1.1
pkgrel=1
pkgdesc="Anaphora Resolution Module in Apertium for low resource languages"
url="https://wiki.apertium.org/wiki/Anaphora_resolution_module"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.7.1')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-anaphora/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eecec77e769291d8c228213a2e52a93239056538aa7dc7e3a97136d806124852')

build() {
    export CXXFLAGS="$CXXFLAGS -I/usr/include/utf8cpp"
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
