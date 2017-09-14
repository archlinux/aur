pkgname=slack-libpurple-git
pkgver=r83.d933332
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
            'ee48127cd4d08643f72c6f6e0be9c86a9d7390d24c9a5aaa9d1ce05cf95cb3e9')

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
