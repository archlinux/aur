# Maintainer: Nora Amita <qiangtianxing@gmail.com>

pkgname=ptyxis-wrapper
pkgver=1.0.0
pkgrel=1
pkgdesc="A wrapper for Ptyxis, ensuring compatibility with applications expecting gnome-terminal."
arch=('any')
url="https://gitlab.gnome.org/chergert/ptyxis"
license=('GPL')
depends=('bash' 'ptyxis')
provides=('gnome-terminal')
conflicts=('gnome-terminal')

build() {
  cat >ptyxis-wrapper <<'EOF'
#!/bin/bash
# gnome-terminal wrapper for ptyxis

if [ $# -eq 0 ]; then
    set -- --tab
fi

eval "args=( $* )"
exec ptyxis "${args[@]}"
EOF
}

package() {
  install -Dm755 ptyxis-wrapper "$pkgdir/usr/bin/ptyxis-wrapper"
  ln -s ptyxis-wrapper "$pkgdir/usr/bin/gnome-terminal"
}
