# Maintainer : gborzi <gborzi@ieee.org>

pkgname=topmenu-mozilla-git
_gitname=topmenu-mozilla
pkgver=2015.08.05
pkgrel=1
pkgdesc="Firefox/Thunderbird Javascript module for TopMenu."
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
arch=('any')
license=('LGPL3')
depends=('topmenu-gtk-git')
makedepends=('git' 'zip')
source=("git+http://git.javispedro.com/cgit/$_gitname.git")
sha1sums=('SKIP')

pkgver() {
   cd "$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/${_gitname}"

   make
}

package() {
    cd "${srcdir}/${_gitname}"
    local _dest="$pkgdir/usr/lib/firefox/browser/extensions/topmenu.mozilla@javispedro.com"
    for i in `cat topmenu-mozilla.files`; do
       install -Dm644 $i "$_dest/$i"
    done
    install -dm755 "$pkgdir/usr/lib/thunderbird/extensions/"
    ln -sf  /usr/lib/firefox/browser/extensions/topmenu.mozilla@javispedro.com "$pkgdir/usr/lib/thunderbird/extensions/topmenu.mozilla@javispedro.com"
}
