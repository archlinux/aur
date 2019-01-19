# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=otodo-git
_pkgname=otodo
pkgver=r84.8a5f7e1
pkgrel=1
pkgdesc="Powerful TUI for todo.txt"
url="https://github.com/onovy/otodo"
depends=(php)
conflicts=(otodo)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/onovy/otodo.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # for color changes see https://github.com/onovy/otodo/issues/4
  sed -i -e '/^todo_file=/s%.*%todo_file="~/todo.txt"%' \
         -e '/^archive_file=/s%.*%archive_file="~/archive.txt"%' \
         -e '/^backup_dir=/s%.*%backup_dir="~/todo.backup"%' \
         -e '/^todo_odd=/s%.*%todo_odd=1%' \
         -e '/^todo_even=/s%.*%todo_even=2%' \
         config.ini
}

package() {
  cd ${srcdir}/${pkgname}
  install -dm755 "$pkgdir/usr/share/otodo" "$pkgdir/usr/bin"
  cp -R * "$pkgdir/usr/share/otodo"
  ln -s /usr/share/otodo/otodo "$pkgdir/usr/bin/otodo"
}

# vim:set ts=2 sw=2 et:
