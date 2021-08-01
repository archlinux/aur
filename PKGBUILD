# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Sean Haugh <seanphaugh@gmail.com>
# Contributor: Chris Salzberg <chris@dejimata.com>
_pkgname=neomutt
pkgname=neomutt-git
pkgver=20210205.r683.g37fd30d1c
pkgrel=1
pkgdesc='A version of mutt with added features - development branch'
url='http://www.neomutt.org/'
license=('GPL')
source=('git+https://github.com/neomutt/neomutt.git#branch=master')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('lua' 'perl' 'notmuch-runtime' 'lmdb' 'kyotocabinet' 'python')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'w3m')
conflicts=('neomutt')
provides=('neomutt')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/(.*)-(.*)-/\1.r\2./; s/-//g'
}

build() {
    cd "$_pkgname"
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
        --gdbm
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}

# vim: ft=sh ts=4 sw=4 et
