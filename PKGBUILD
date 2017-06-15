# Maintainer:  Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Gokcehan Kara <gokcehankara@gmail.com>
# Contributor: Guillaume ALAUX <Guillaume at ALAUX dot net>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

_ref=""
pkgname=kakoune-git
pkgver=r4446.650a989
pkgrel=1
pkgdesc='Code editor heavily inspired by Vim'
arch=('i686' 'x86_64')
url='https://github.com/mawww/kakoune'
license=('custom:unlicense')
depends=('ncurses' 'boost')
optdepends=('xorg-xmessage: for nicer debugging messages'
            'xdotool: add support for kak windows switching (in grep, make... files)'
            'clang: add command for C/CPP insert mode completion support'
            'universal-ctags-git: provides `readtags` used by `:tag` command to jump on a tag definition'
            'tmux: tabbing support')
makedepends=('git' 'asciidoc')

source=("${pkgname}::git+https://github.com/mawww/kakoune.git${_ref}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${pkgname}/src"
  make test
}

build() {
  cd "${srcdir}/${pkgname}/src"
  debug=no make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  debug=no make install-strip DESTDIR="${pkgdir}" PREFIX=/usr
  install -D ../UNLICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
