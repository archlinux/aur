# Maintainer: Jabber Developer <jabber dot developer at jabber dot space>
pkgname=jabber-space
pkgver=7544.f636090f
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="https://jabber.space/"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c'
          'gpgme' 'libstrophe-git')
makedepends=('git' 'autoconf-archive')
provides=('profanity')
conflicts=('profanity')
source=("git+https://git.jabber.space/devs/profanity.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/profanity"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/profanity"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/profanity"
  make DESTDIR="$pkgdir" install
}

