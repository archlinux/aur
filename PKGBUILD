# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=kvazaar
pkgver=1.3.0
pkgrel=1
pkgdesc='An open-source HEVC encoder'
arch=('x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('glibc' 'gcc-libs' 'crypto++')
makedepends=('git' 'yasm')
checkdepends=('ffmpeg' 'hm')
source=("git+https://github.com/ultravideo/kvazaar.git#tag=v${pkgver}"
        'git+https://github.com/ultravideo/greatest.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd kvazaar
    
    git submodule init
    git config --local submodule.greatest.url "${srcdir}/greatest"
    git submodule update
    
    ./autogen.sh
}

build() {
    cd kvazaar
    
    ./configure \
        --prefix='/usr' \
        --with-cryptopp
        
    make
}

check() {
    cd kvazaar
    
    make check
}

package() {
    cd kvazaar
    
    make DESTDIR="$pkgdir" install
}
