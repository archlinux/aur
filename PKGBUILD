# Maintainer: Nora Amita <qiangtianxing@gmail.com>

pkgname=alacritty-wrapper
pkgver=1.0.0
pkgrel=1
pkgdesc="A wrapper for Alacritty, ensuring compatibility with applications expecting gnome-terminal."
arch=('any')
url="https://github.com/alacritty/alacritty"
license=('GPL')
depends=('bash' 'alacritty')
provides=('gnome-terminal')
conflicts=('gnome-terminal')

build() {
  cat >alacritty-wrapper <<'EOF'
#!/bin/bash
# gnome-terminal wrapper for alacritty

eval "args=( $* )"
exec alacritty "${args[@]}"
EOF
}

package() {
  install -Dm755 alacritty-wrapper "$pkgdir/usr/bin/alacritty-wrapper"
  ln -s alacritty-wrapper "$pkgdir/usr/bin/gnome-terminal"
}
