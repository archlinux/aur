# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=groupme-purple-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname="${pkgname%-git}"
pkgver=r50.d7dd308
pkgrel=1
pkgdesc=" libpurple plugin for GroupMe "
arch=('x86_64' 'i686')
url="https://notabug.org/alyssa/groupme-purple/"
license=('GPLv3')
groups=()
depends=('libpurple')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+https://notabug.org/alyssa/groupme-purple.git"
	"Icon.png" "Icon-16.png" "Icon-22.png" "Icon-48.png")
sha256sums=('SKIP'
            '69cdefeab976e0b6e563267b0ae8bb90686cc767e5021950b1d9bdf2bddd2ba4'
            '70e23ea6e116e9ec00931dc499e39e3e3c01d4e51f5ae5ece62f57ef3638fb9e'
            '6562186911c48b044c2a8e5cd55b511dec95672884fc469a2713278faeb0b351'
            '2661dbe37daa8e064aa80937e12f0cf8b79161f91153ffd7029a998986e03531'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  make clean
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  #./autogen.sh
  #./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${_pkgname}"
  #make DESTDIR="${pkgdir}/" install
  install -Dm 644 libgroupme.so "${pkgdir}/usr/lib/purple-2/libgroupme.so"
  cd "${srcdir}"
  local sizes="16 22 48"
  for s in ${sizes};do
    install -Dm 644 Icon-${s}.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/${s}/groupme.png"
  done
}
