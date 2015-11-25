# Maintainer: Jan Holthuis <holthuis dot jan at googlemail dot com>
pkgname=phonetisaurus-git
pkgver=r34.317a177
pkgrel=1
pkgdesc="WFST-driven grapheme-to-phoneme (g2p) framework suitable for rapid development of high quality g2p or p2g systems."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/AdolfVonKleist/Phonetisaurus"
license=('BSD')
depends=('openfst')
source=("git+https://github.com/AdolfVonKleist/Phonetisaurus.git")
sha256sums=('SKIP')
provides=('phonetisaurus')
conflicts=('phonetisaurus')

pkgver() {
  cd "$srcdir/Phonetisaurus"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Phonetisaurus/src"
    ./configure \
    	--with-openfst-libs="/usr/lib" \
        --with-openfst-includes="/usr/include" \
        --with-install-bin="${pkgdir}/usr/bin" \
        --with-install-lib="${pkgdir}/usr/lib"
    make
}

package() {
    cd "$srcdir/Phonetisaurus/src"

	mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib"
    make install
}