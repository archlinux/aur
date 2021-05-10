# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=suru-plus-folders-git
pkgver=.1.8.1.0.g8c88b5c
pkgrel=1
pkgdesc="Allows to change the color of folders (git version)"
url="https://github.com/gusbemacbe/suru-plus-folders"
arch=('any')
license=('LGPL3')
depends=('inetutils')
makedepends=('git')
provides=("suru-plus-folders")
options=('!strip')
source=("$pkgname::git+https://github.com/gusbemacbe/suru-plus-folders.git"
        "suru-plus-folders.hook")
sha256sums=('SKIP'
            '32599e354ec625a9722b987c3938c8609f45c60d95e8b24b6130147a5cde56c2')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/./g'

}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}/" install
  
  install -Dm644 ../suru-plus-folders.hook "$pkgdir/usr/share/libalpm/hooks/suru-plus-folders.hook"  
}
