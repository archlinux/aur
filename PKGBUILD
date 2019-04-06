# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='undistract-me-git'
pkgver=r77.c7f6056
pkgrel=10
arch=('any')
url="https://github.com/jml/undistract-me"
depends=('libnotify' 'xorg-xprop')
conflicts=('undistract-me')
license=("MIT")
pkgdesc="Notifies you when long-running terminal commands complete"
source=("git://github.com/jml/undistract-me.git")
md5sums=('SKIP')
install='undistract-me.install'

pkgver() {
  cd "$srcdir/undistract-me"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/undistract-me"
  mkdir -p "$pkgdir/usr/share/doc/undistract-me"
  mkdir -p "$pkgdir/etc/profile.d/"
  sed -ni '/Copyright/,/developers\"./p' "$srcdir/undistract-me/LICENSE"
  install -D -m644 "$srcdir/undistract-me/long-running.bash" "$pkgdir/usr/share/undistract-me/long-running.bash"
  install -D -m644 "$srcdir/undistract-me/preexec.bash" "$pkgdir/usr/share/undistract-me/preexec.bash"
  install -D -m644 "$srcdir/undistract-me/undistract-me.sh" "$pkgdir/etc/profile.d/undistract-me.sh"
  install -D -m644 "$srcdir/undistract-me/README.md" "$pkgdir/usr/share/doc/undistract-me/README.md"
  install -D -m644 "$srcdir/undistract-me/LICENSE" "$pkgdir/usr/share/doc/undistract-me/COPYING"
}
