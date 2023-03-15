# Maintainer: trumpetrespas <trumpetrespas1 at proton dot me>
# Note about email. This is a different email than I normally use, so I do not check it that frequently. To reach me faster, comment on the package, that way I will get the message in my personal email.
pkgname=kodi-addon-audiodecoder-openmpt
pkgver=20.2.0
_codename=Nexus
pkgrel=0
pkgdesc="Kodi add-on for decoding formats such as xm, and mod"
arch=('x86_64')
url="https://github.com/xbmc/audiodecoder.openmpt"
license=('GPL2')
groups=() 
makedepends=('cmake' 'kodi-dev' 'libheif' 'tinyxml2' )
depends=('kodi' 'libheif' 'tinyxml2' 'libopenmpt')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xbmc/audiodecoder.openmpt/archive/refs/tags/$pkgver-$_codename.zip")
sha256sums=('4f194cb43681f0221a9b78c1d7693c08b39ba97660d0d496e05c72b3e9f6ec2b')

build() {
    cd "audiodecoder.openmpt-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    cd "audiodecoder.openmpt-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
