# Maintainer: Rukkhadevata123 <3083913301@qq.com>
# Contributor: Marko Givens <marcxjo@cerebralbleach.com>
# Contributor: Rukkhadevata123 <3083913301@qq.com>

pkgname=gnome-shell-extension-extension-list
_pkgname=extension-list
pkgver=48.0  # 更新版本号
pkgrel=1
pkgdesc="A Simple GNOME Shell extension manager in the top panel"
arch=('any')
url="https://github.com/tuberry/extension-list"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'sassc')
provides=('gnome-shell-extension-extension-list')
conflicts=('gnome-shell-extension-extension-list-git')
source=("$_pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
  meson setup build -Dtarget=system -Dversion=48 --prefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  meson install -C build --destdir "$pkgdir"
}