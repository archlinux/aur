# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net

_pkgname=bitwarden-menu
_gitname=bitwarden-menu
pkgname=$_pkgname-git
pkgver=r172.b2b0a2d
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for Bitwarden/Vaultwarden."

arch=('any')
url="https://github.com/firecat53/bitwarden-menu"
license=('MIT')
depends=('python' 'bitwarden-cli' 'python-xdg-base-dirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
optdepends=('python-pynput: autotyping with the default type_library'
            'dmenu: dmenu backend'
            'bemenu: bemenu backend'
            'fuzzel: fuzzel backend'
            'wmenu: wmenu backend'
            'rofi: rofi backend'
            'wofi: wofi backend'
            'yofi: yofi backend'
            'tofi: tofi backend'
            'xdotool: required for typing non-U.S. Unicode characters'
            'wtype: required for typing non-U.S. Unicode characters'
            'ydotool: required for typing non-U.S. Unicode characters'
            'pinentry: secure passphrase entry'
            'xsel: clipboard support (X11)'
            'xclip: clipboard support (X11)'
            'wl-clipboard: clipboard support (Wayland)')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

prepare() {
  git -C "$_gitname" clean -dfx
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
