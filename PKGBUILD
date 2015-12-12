# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=watchman-git
_gitname=watchman
pkgver=r717.a75b2b8
pkgrel=1
pkgdesc='Watches files and records, or triggers actions, when they change.'
arch=('i686' 'x86_64')
url='https://facebook.github.io/watchman/'
license=('Apache')
depends=('pcre')
makedepends=('git')
conflicts=()
options=('!libtool' 'staticlibs')
provides=()
source=("${_gitname}::git+https://github.com/facebook/watchman.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-pcre \
              --without-python \
              --enable-statedir="/var/lib/${_gitname}"
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}

# Local Variables:
# compile-command: "makepkg -sm && mksrcinfo"
# End:
