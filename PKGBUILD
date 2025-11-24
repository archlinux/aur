# Maintainer: Grouvya! <grouvya@gmail.com>
pkgname=gnome-menu-editor-git
_pkgname=gnome-menu-editor
pkgver=1.0.0.r1.gabcdef  # This will update automatically when you build
pkgrel=1
pkgdesc="A simple Python/GTK3 Menu Editor for GNOME"
arch=('any')
url="https://github.com/YOUR_USERNAME/gnome-menu-editor" # <--- CHANGE THIS
license=('MIT') # Or 'GPL', depending on what you chose
depends=('python' 'gtk3' 'python-gobject')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # Install the python script to /usr/bin/
  # We rename the script to the package name so users can type 'gnome-menu-editor' to launch it
  install -Dm755 menu.py "$pkgdir/usr/bin/$_pkgname"
  
  # Optional: Install a license file if you have one
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
