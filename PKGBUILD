_ref=""
pkgname=kakoune-git
pkgver=r7139.8587ecae
pkgrel=1
pkgdesc='Multiple-selection, UNIX-flavored modal editor'
arch=('x86_64' 'armv7h')
url='https://github.com/mawww/kakoune'
license=('custom:unlicense')
depends=(
  'ncurses'
)
optdepends=(
  'aspell: spell checking support'
  'clang: add command for C/CPP insert mode completion support'
  'ranger: provides file explorer functionality'
  'tmux: tabbing support'
  'universal-ctags-git: provides `readtags` used by `:tag` command to jump on a tag definition'
  'xdotool: add support for kak windows switching (in grep, make... files)'
  'xorg-xmessage: for nicer debugging messages'
)
makedepends=(
  'git'
  'pkgconf'
)
provides=('kakoune')
conflicts=('kakoune')
source=("${pkgname}::git+https://github.com/mawww/kakoune.git${_ref}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${pkgname}/src"
  make debug=no test
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make debug=no
}

package() {
  cd "${srcdir}/${pkgname}/src"
  make debug=no install-strip DESTDIR="${pkgdir}" PREFIX=/usr
  install -D ../UNLICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
