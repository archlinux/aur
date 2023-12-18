# Maintainer: Tim Paik <timpaik@163.com>
_extname=quick-settings-tweaks
_uuid=$_extname@qwreey
pkgname=gnome-shell-extension-$_extname-git
pkgver=r235.a9bd1ae
pkgrel=1
pkgdesc="A Gnome 43+ extension which allows you to customize the new Quick Settings Panel to your liking!"
arch=('any')
url="https://github.com/qwreey75/quick-settings-tweaks"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "gnome-shell-extensions-quick-settings-tweaks-git")
source=('git+https://github.com/qwreey75/quick-settings-tweaks.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_extname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_extname"
  ./install.sh build
}

package() {
  cd "$srcdir/$_extname"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf "dist/$_uuid.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  chown root:root -R "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
