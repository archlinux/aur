# Maintainer: Sean Haugh <seanphaugh@gmail.com>
# Contributor: Chris Salzberg <chris@dejimata.com>
_pkgname=neomutt
pkgname=neomutt-git
pkgver=20171215.r144.gb7da81ad
pkgrel=1
pkgdesc='The New Mutt: powerful text-based mail client with all the best feature patches'
url='http://www.neomutt.org/'
license=('GPL')
source=('git+https://github.com/neomutt/neomutt.git#branch=master')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('notmuch-runtime' 'lua' 'python')
optdepends=('urlview: for url menu')
makedepends=('git' 'gnupg' 'libxslt')
conflicts=('neomutt')
provides=('neomutt')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/^neomutt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Configure the build.
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-debug \
    --enable-pgp \
    --enable-gpgme \
    --enable-notmuch \
    --enable-lua \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl=/usr \
    --with-idn=/usr \
    --with-gdbm=/usr

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install
}
# vim: ft=sh ts=2 sw=2 et
