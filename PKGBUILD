# Maintainer: Xavier Peng <png.inside@gmail.com>

pkgname=chez-scheme
pkgver=9.4
pkgrel=2
pkgdesc="Chez Scheme is a compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('APL')
makedepends=('binutils' 'make' 'ncurses' 'libx11' 'xproto')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
replaces=('petite-chez-scheme' 'chez-scheme-git')
source=('https://github.com/cisco/ChezScheme/archive/v9.4.tar.gz'
        'https://github.com/nanopass/nanopass-framework-scheme/archive/221eecb965d9dfacccd97d1cb73f2a31c4119d3a.zip'
        'https://github.com/dybvig/stex/archive/3bd2b86cc5ae1797d05fc5cc6f11cc43383f741d.zip'
        'https://github.com/madler/zlib/archive/50893291621658f355bc5b4d450a8d06a563053d.zip')
sha1sums=('f1273793cbceb545e51baa2cbf1be1d9c870c8f4'
          '0d9f54741c4f0af31255241f98087aedced0e5e7'
          '91445bc89d4d377b1008c314d069bed74094d892'
          'b6e1ad0c47a5f620d10d3e19efd46b1762a80510')
_archivename=ChezScheme-$pkgver

build() {
    cd "$srcdir/${_archivename}" || exit
    rm -r nanopass/ stex/ zlib/
    mv ../nanopass-framework-scheme-221eecb965d9dfacccd97d1cb73f2a31c4119d3a ./nanopass
    mv ../stex-3bd2b86cc5ae1797d05fc5cc6f11cc43383f741d ./stex
    mv ../zlib-50893291621658f355bc5b4d450a8d06a563053d ./zlib
    ./configure --installprefix=/usr --temproot=$pkgdir
    make
}

package() {
    cd "${srcdir}/${_archivename}" || exit
    make install DESTDIR="$pkgdir"
}
