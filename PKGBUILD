# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Chris Salzberg <chris@dejimata.com>
# Contributor: Leonidas Spyropoulos <artafinde@gmail.com>
pkgname=neomutt-autocrypt
_srcname=neomutt
# This package should mirror community/neomutt,
# except for added autocrypt
pkgver=20191129
pkgrel=1
pkgdesc='A version of neomutt with added autocrypt'
url='https://neomutt.org/'
license=('GPL')
arch=('x86_64')
depends=('glibc' 'gpgme' 'lua' 'notmuch-runtime' 'krb5' 'openssl'
         'libsasl' 'ncurses' 'libidn2' 'lmdb' 'gdbm' 'kyotocabinet'
	 'sqlite')
provides=('neomutt')
conflicts=('neomutt')
optdepends=('python: keybase.py')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'w3m')
_github='https://github.com/neomutt/neomutt'
source=("$pkgname-$pkgver.tar.gz::$_github/archive/$pkgver.tar.gz")
sha256sums=('c339e17b676d0a9a8db6dd1c9acac3db4b217c6b19050e5a1eec99b1b0b59a2f')

build() {
    cd "$_srcname-$pkgver"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --gpgme \
        --enable-lua \
        --notmuch \
        --gss \
        --ssl \
        --sasl \
        --with-ui=ncurses \
        --with-idn2=/usr \
        --idn=0 \
        --idn2=1 \
        --lmdb \
        --kyotocabinet \
        --gdbm \
	--enable-autocrypt \
	--sqlite
    make
}

package() {
    cd "$_srcname-$pkgver"
    make DESTDIR="$pkgdir" install
}

# eof
