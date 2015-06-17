# Contributor:  Lucas de Vries <lucasdevries@gmail.com>
# Contributer:  Quan Guo <guotsuan@gmail.com>
arch=(i686 x86_64)
pkgname=eminent-git
pkgver=2014.10.23.ge6b721e
pkgrel=1
pkgdesc="Effortless wmii-style dynamic tagging for the awesome window manager version 3.5 or later, second iteration"
license=('GPL')
url="https://github.com/guotsuan/eminent"

depends=('awesome')
makedepends=('git')
conflicts=('eminent')
provides=('eminent')

#_gitroot=git://github.com/guotsuan/eminent.git
_gitname=eminent

source=("git://github.com/guotsuan/eminent.git")
md5sums=('SKIP')

pkgver() {
    #cd $_gitname
    #echo $(git rev-list --count master).$(git rev-parse --short master)


  cd "${srcdir}/${_gitname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}


build() {
  cd $_gitname
  luac -o eminent.luac eminent.lua
}

package() {
  cd $_gitname
  install -D -m644 eminent.lua ${pkgdir}/usr/share/awesome/lib/eminent.lua
  install -D -m644 eminent.luac ${pkgdir}/usr/share/awesome/lib/eminent.luac
}
