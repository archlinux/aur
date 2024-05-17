# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>
# PKGBUILD Fixed by: Sergey Alexeyev <s.n.alexeyev@gamil.com>

author=BlackArch
pkgname=torctl-git
_gitname=torctl
pkgver=0.r26.202e4b2
pkgrel=1
pkgdesc='Script to redirect all traffic through tor network including dns queries for anonymizing entire system.'
arch=('any')
url='https://github.com/BlackArch/torctl'
license=('GPL3')
depends=('tor' 'systemd' 'curl' 'iptables' 'secure-delete' 'iproute2' 'macchanger')
makedepends=("git" "make" "fakeroot" "gcc")
provides=("torctl")
source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm 755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_gitname/" README.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
  install -Dm 644 service/$_gitname-autostart.service \
    "$pkgdir/etc/systemd/system/$_gitname-autostart.service"
  install -Dm 644 service/$_gitname-autowipe.service \
    "$pkgdir/etc/systemd/system/$_gitname-autowipe.service"
  install -Dm 644 bash-completion/$_gitname \
    "$pkgdir/usr/share/bash-completion/completions/$_gitname"
}


