# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contrubutor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Chris Salzberg <chris@dejimata.com>
# Contributor: Leonidas Spyropoulos <artafinde@gmail.com>

_pkgname=neomutt
pkgname=neomutt-backends
pkgver=20180716
pkgrel=1
pkgdesc='A version of mutt with added features (more backend support)'
url='http://www.neomutt.org/'
license=('GPL')
arch=('x86_64')
depends=('notmuch-runtime' 'lua')
optdepends=('python: keybase.py')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'lynx' 'lmdb' 'kyotocabinet' )
conflicts=('neomutt')
provides=('neomutt')
source=("https://github.com/neomutt/neomutt/archive/$_pkgname-$pkgver.tar.gz"
        "https://github.com/neomutt/neomutt/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz.sig")
sha256sums=('bd89826980b493ba312228c9c14ffe2403e268571aea6008c6dc7ed3848de200'
            'SKIP')
validpgpkeys=('86C2397270DD7A561263CA4E5FAF0A6EE7371805') # Richard Russon (flatcap) <rich@flatcap.org>

build() {
    cd "$_pkgname-$_pkgname-$pkgver"
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
        --with-idn=/usr \
	--lmdb \
	--kyotocabinet \
        --gdbm
    make
}

package() {
    cd "$_pkgname-$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
