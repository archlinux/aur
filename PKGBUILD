# Maintainer: Jan Wozniak <wozniak.jan@gmail.com>

pkgname=erlang-basho
pkgver=16.2
pkgrel=1
pkgdesc='Version of Erlang/OTP needed for Basho RiakTS'
arch=('i686' 'x86_64')
license=('Apache')
url=https://github.com/basho/otp/archive/OTP_R16B02_basho10.tar.gz
conflicts=('erlang')
depends=('ncurses' 'glu' 'wxgtk' 'openssl')
makedepends=('perl' 'mesa' 'lksctp-tools' 'unixodbc' 'wxgtk' 'glu' 'git'
             'libxslt' 'fop' 'java-environment' 'autoconf')
optdepends=('erlang-unixodbc: database support'
            'java-environment: for Java support'
            'lksctp-tools: for SCTP support')
options=('staticlibs')
source=(
    "https://github.com/basho/otp/archive/OTP_R16B02_basho10.tar.gz"
)
md5sums=('eb946f87cedca861fae4aeae21ab514a')

build() {
    cd "$srcdir/otp-OTP_R16B02_basho10"

    msg "Building"
    ./otp_build autoconf
    ./configure --prefix="/usr" --enable-smp-support --with-odbc 
    make
}

package() {
    cd "$srcdir/otp-OTP_R16B02_basho10"

    msg "Installing"
    make DESTDIR="$pkgdir" install

    # Remove files that are packaged as erlang-unixodbc
    rm -r "$pkgdir/usr/lib/erlang/lib/odbc"*
}
