# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ianux
# Contributor: priyank
# Contributor: etix

pkgname=ices0
pkgver=0.4.11
pkgrel=3
pkgdesc="A source client for broadcasting in MP3, FLAC, AAC and OGG Vorbis formats to an icecast2 server"
arch=("i686" "x86_64" "armv7h")
license=("GPL-2.0")
url="https://github.com/Moonbase59/ices0"
depends=("lame" "libxml2" "libshout" "perl" "python2")
optdepends=("flac: flac audio support"
            "faad2: aac audio support"
            "libmp4v2: aac audio support"
            "libogg: vorbis audio support"
            "libvorbis: vorbis audio support")
makedepends=("autoconf" "pkgconf")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("9b599abf4bcd66761fe99c024644f623")
options=("!docs")
install="$pkgname.install"

build(){
 cd "${srcdir}/$pkgname-$pkgver"
 aclocal
 autoreconf -fi
 automake --add-missing
 ./configure --prefix="/usr" --sysconfdir="/usr/share/$pkgname" -mandir="/usr/share" \
  --with-python="/usr/bin/python2"
 make
}

package(){
 cd "${srcdir}/$pkgname-$pkgver"
 make DESTDIR="${pkgdir}" install
 # Rename files to avoid conflict with ices2
 mv "${pkgdir}/usr/bin/ices" "${pkgdir}/usr/bin/ices0"
 mv "${pkgdir}/usr/share/man1/ices.1" "${pkgdir}/usr/share/man1/ices0.1"
 install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

