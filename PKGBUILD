pkgname=slack-libpurple-git
pkgver=r150.b0f1550
pkgver() {
  cd "$srcdir/slack-libpurple/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Slack."
url='https://github.com/dylex/slack-libpurple.git'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
options=(!strip)
depends=('libpurple' 'json-parser-git')
source=('slack-libpurple::git+https://github.com/dylex/slack-libpurple.git'
	'api-token-in-passwd.patch')
sha256sums=('SKIP'
            'de4d34ba2985fbd582695c281d98ea171971325d95f7d39fb80881ed2f3a84d7')

prepare() {
  cd "$srcdir/slack-libpurple/"
  patch -p1 <"$srcdir"/api-token-in-passwd.patch
}

build() {
  cd "$srcdir/slack-libpurple/"
  make
}

package() {
  cd "$srcdir/slack-libpurple/"
  make DESTDIR="$pkgdir" install
}
