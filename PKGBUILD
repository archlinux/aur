# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=okcupid-pidgin-git
_pkgname="${pkgname%-git}"
pkgver=r105.b2ff1ec
pkgrel=1
pkgdesc="OKCupid Dating Site Plugin for Pidgim IM client"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/EionRobb/okcupid-pidgin/"
license=('GPLv3')
depends=('libpurple')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/EionRobb/okcupid-pidgin.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  make clean
}

build() {
  cd "${srcdir}/${_pkgname}"
  make libokcupid64.so
}

package() {
  cd "${srcdir}/${_pkgname}"
  #make DESTDIR="$pkgdir/" install
  install -Dm644 libokcupid64.so "${pkgdir}/usr/lib/purple-2/libokcupid64.so"
  local icon_sizes="16 22 48"
  for size in ${icon_sizes};do
    install -Dm644 icons/${size}/okcupid.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/${size}/okcupid.png"
  done
}
