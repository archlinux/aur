# Maintainer: Jabber Developer <jabber dot developer at jabber dot space>
_pkgname=cproof
pkgname="${_pkgname}-git"
pkgver=7654.5d7b7bb2
pkgrel=1
pkgdesc="CLI XMPP client."
arch=('i686' 'x86_64')
url="https://jabber.space/"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c'
          'gpgme' 'libstrophe-git')
makedepends=('git' 'autoconf-archive')
conflicts=("$_pkgname")
provides=("$_pkgname")
replaces=('jabber-space')
source=("git+https://git.jabber.space/devs/cproof.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cproof"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/cproof"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/cproof"
  make DESTDIR="$pkgdir" install
}

