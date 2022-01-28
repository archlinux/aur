# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=gnurl
pkgver=7.72.0
pkgrel=1
pkgdesc="fork of libcurl, which is mostly for GNUnet"
arch=(x86_64)
url="https://gnunet.org/en/gnurl.html"
license=('MIT')
depends=('gnutls' 'krb5' 'libnghttp2' 'zstd')
source=("https://ftp.gnu.org/gnu/gnunet/gnurl-$pkgver.tar.Z") #{,.sig})
#validpgpkeys=('A88C8ADD129828D7EAC02E52E22F9BBFEE348588'  # Nils Gillmann
#              '6115012DEA3026F62A98A556D6B570842F7E7F8D') # nikita@3dfx.re
sha256sums=('45b4e3cc1f052b2d56d076c276f65358e6f643b217d72b9a35e7a945f8601668')

build() {
  cd $pkgname-$pkgver
  ./buildconf
  ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --disable-dict \
        --disable-file \
        --disable-ftp \
        --disable-gopher \
        --disable-imap \
        --disable-ldap \
        --disable-ldaps \
        --disable-ntlm-wb \
        --disable-pop3 \
        --disable-rtsp \
        --disable-smb \
        --disable-smtp \
        --disable-telnet \
        --disable-tftp \
        --enable-ipv6 \
        --enable-manual \
        --enable-versioned-symbols \
        --enable-threaded-resolver \
        --without-gssapi \
        --with-gnutls \
        --without-libidn \
        --without-libpsl \
        --without-librtmp \
        --without-ssl \
        --disable-ftp \
        --disable-file \
        --with-random=/dev/urandom \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

#  rm -rf "$pkgdir"/usr/share/man \
#    "$pkgdir"/usr/bin/curl \
#    "$pkgdir"/usr/share/aclocal
#  mkdir -p "$pkgdir"/usr/include/gnurl
#  mv "$pkgdir"/usr/include/curl "$pkgdir"/usr/include/gnurl/curl
#  sed -i 's|includedir=.*|includedir=/usr/include/gnurl|g' "$pkgdir"/usr/lib/pkgconfig/libgnurl.pc
}
