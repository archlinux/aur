# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=papirus-folders-git
pkgver=1.7.0.0.g84007c1
pkgrel=1
pkgdesc="Allows to change the color of folders (git version)"
url="https://github.com/PapirusDevelopmentTeam/papirus-folders"
arch=('any')
license=('LGPL3')
depends=('papirus-icon-theme' 'ineutils')
makedepends=('git')
provides=("papirus-folders")
options=('!strip')
source=("${pkgname}::git+https://github.com/PapirusDevelopmentTeam/papirus-folders.git"
        "papirus-folders.hook")
sha256sums=('SKIP'
            'b6f52cab4c7a42e85b7e3cc0160bb9cf060aed20ab78ee2135a3f18dcaf6e92c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/./g'

}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  
  install -Dm644 ../papirus-folders.hook "$pkgdir/usr/share/libalpm/hooks/papirus-folders.hook"  
}
