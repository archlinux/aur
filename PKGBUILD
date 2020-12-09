pkgname=kakoune-git
pkgver=2020.09.01_r231_gce96c3f2
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
)
provides=("kakoune=${pkgver}")
conflicts=('kakoune')
source=("${pkgname}::git+https://github.com/mawww/kakoune.git")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | tr '-' '_' | sed 's/^v//; s/_/_r/'
}

check() {
  cd "${srcdir}/${pkgname}/src"
  make test
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  make install-strip DESTDIR="${pkgdir}" PREFIX=/usr
  install -D ../UNLICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
