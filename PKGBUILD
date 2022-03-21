# Maintainer : Antonio Orefice <kokoko3k@gmail.com>

pkgname=gopreload-git
_gitname=gopreload
pkgver=r59.21b08e6
pkgrel=1
pkgdesc="Preloads files needed for given programs"
arch=('any')
url="http://forums.gentoo.org/viewtopic-t-622085-highlight-preload.html"
license=('GPL')
depends=('strace')
optdepends=('wmctrl: needed by gopreload-batch-refresh.sh')
makedepends=('git')
provides=('gopreload')
conflicts=('gopreload')
backup=('etc/gopreload.conf')
install=${_gitname}.install
#source=('git://github.com/kokoko3k/gopreload.git')
source=('git+https://github.com/kokoko3k/gopreload.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  mv README "usr/share/${_gitname}/"

#  cd "usr/share/${_gitname}/mapandlock.source"
  cd "usr/share/${_gitname}/fmlock.source"
  ./compile.sh && ./install.sh

  rm -R  ../fmlock.source
}

package() { 
  cd "${srcdir}/${_gitname}"

  mv * "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/share/gopreload/bin/Prepare.sh "${pkgdir}/usr/bin/gopreload-prepare"
  ln -s /usr/share/gopreload/bin/batch_refresh.sh "${pkgdir}/usr/bin/gopreload-batch-refresh.sh"
}

# vim:set ts=2 sw=2 et:

