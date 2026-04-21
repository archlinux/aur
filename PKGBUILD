# Maintainer: Marcin Mikołajczak <me@m4sk.in>
pkgname=splatmoji-git
_pkgname=splatmoji
pkgver=r92.b8d14b4
pkgrel=1
pkgdesc="Quickly look up and input emoji and/or emoticons/kaomoji on your GNU/Linux desktop via pop-up menu."
arch=('any')
url="https://github.com/cspeterson/$_pkgname"
license=('MIT')
depends=('rofi' 'xdotool' 'xsel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/cspeterson/$_pkgname.git")
install=splatmoji-git.install
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "$_pkgname/{.git/, .git* ,README.md}"
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir/usr/share/$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_pkgname"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
cd /usr/share/splatmoji
exec bash splatmoji "\${@}"
EOF

  chmod a+x "$pkgdir/usr/bin/$_pkgname"
}
