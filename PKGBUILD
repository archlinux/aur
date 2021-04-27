# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>
_pkgname=ZeroTier-GUI
pkgname=zerotier-gui-git
pkgver=1.2.1
pkgrel=1
pkgdesc="A Linux front-end for ZeroTier"
arch=(any)
url="https://github.com/tralph3/ZeroTier-GUI.git"
license=('GPL3')
depends=(tk python polkit)
makedepends=(git)
optdepends=('zerotier-one: Provides the backend of the program')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.2.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local licdir="$pkgdir/usr/share/licenses/${pkgname%-git}"
  local bindir="$pkgdir/usr/bin"
  local imgdir="$pkgdir/usr/share/pixmaps"
  local appdir="$pkgdir/usr/share/applications"
  local docdir="$pkgdir/usr/share/doc/${pkgname%-git}"

  cd "${srcdir}/$_pkgname"
  install -Dm0644 --target-directory "$docdir" "$srcdir/$_pkgname/README.md"
  install -Dm0644 --target-directory "$licdir" "$srcdir/$_pkgname/LICENSE"
  install -Dm0644 --target-directory "$imgdir" "$srcdir/$_pkgname/img/zerotier-gui.png"
  install -Dm0644 --target-directory "$appdir" "$srcdir/$_pkgname/zerotier-gui.desktop"
  install -Dm0755 --target-directory "$bindir" "$srcdir/$_pkgname/src/zerotier-gui"
}
