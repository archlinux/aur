# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: richteer <richteer at lastprime.net>

pkgname=profanity-git
pkgver=6749.4e956410
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="http://profanity-im.github.io"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c'
          'gpgme' 'libstrophe-git')
makedepends=('git' 'autoconf-archive')
provides=('profanity')
conflicts=('profanity')
source=("git+https://github.com/profanity-im/profanity.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}
  make DESTDIR="$pkgdir" install
}

