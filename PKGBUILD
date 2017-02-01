# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=i3lock-fancy
pkgname=i3lock-fancy-git
pkgver=r112.fe7fe47
pkgrel=1
pkgdesc="i3lock-color script: blurs background, adds lock icon and text, offers dark/light background detection."
arch=('i686' 'x86_64')
url="https://github.com/meskarune/i3lock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'bash' 'util-linux' 'imagemagick' 'i3lock')
optdepends=('wmctrl: minimize windows before locking'
            'scrot: alternative screenshot creator'
            'maim: alternative screenshot creator'
            'gnome-screenshot: alternative screenshot creator')
makedepends=('git')
provides=('i3lock-fancy')
source=("git+https://github.com/meskarune/$_gitname.git" "package.patch")
md5sums=('SKIP'
         '56d24ac20d8b6fd90c2473da609355f7')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    patch -N "$srcdir/$_gitname/lock" "$srcdir/package.patch"
}
package() {
    cd "${srcdir}/$_gitname"
    install -Dm755 lock "$pkgdir/usr/bin/i3lock-fancy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
    install -dm755 "$pkgdir/usr/share/$_gitname/icons"
    install -m644 -t "$pkgdir/usr/share/$_gitname/icons" icons/*
}
