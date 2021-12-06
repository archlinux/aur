# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>
_pkgname=Steam-Metadata-Editor
pkgname=steam-metadata-editor-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A metadata editor for Steam"
arch=(any)
url="https://github.com/tralph3/Steam-Metadata-Editor.git"
license=('GPL3')
depends=(tk python)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  mkdir -pv $HOME/.local/share/${_pkgname}/config

  local licdir="$pkgdir/usr/share/licenses/${pkgname%-git}"
  local bindir="$pkgdir/usr/bin"
  local imgdir="$pkgdir/usr/share/pixmaps/${pkgname%-git}"
  local appdir="$pkgdir/usr/share/applications"
  local docdir="$pkgdir/usr/share/doc/${pkgname%-git}"

  cd "${srcdir}/$_pkgname"
  install -Dm0644 --target-directory "$docdir" "$srcdir/$_pkgname/README.md"
  install -Dm0644 --target-directory "$licdir" "$srcdir/$_pkgname/LICENSE"
  install -Dm0644 --target-directory "$imgdir" "$srcdir/$_pkgname/img/steam-metadata-editor.png"
  install -Dm0644 --target-directory "$imgdir" "$srcdir/$_pkgname/src/img/UpArrow.png"
  install -Dm0644 --target-directory "$imgdir" "$srcdir/$_pkgname/src/img/DownArrow.png"
  install -Dm0644 --target-directory "$imgdir" "$srcdir/$_pkgname/src/img/Delete.png"
  install -Dm0644 --target-directory "$appdir" "$srcdir/$_pkgname/steam-metadata-editor.desktop"
  install -Dm0755 --target-directory "$bindir" "$srcdir/$_pkgname/src/steammetadataeditor"
}
