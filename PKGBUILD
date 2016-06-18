# Maintainer: edio <edio@archlinux.us>

_gitname=randrctl
pkgname=$_gitname-git
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.0.r1.312e37c
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPLv3')
makedepends=('git' 'python-pip')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=('git+https://github.com/edio/randrctl.git')
md5sums=('SKIP')
provides=("$_gitname")
conflicts=("$_gitname")
install="randrctl.install"

pkgver() {
    cd $_gitname
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd $_gitname

  # PKGBUILD handles setup
  rm bin/randrctl-setup

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 randrctl/misc/config.ini "$pkgdir/etc/randrctl/config.ini"
  install -Dm644 randrctl/misc/completion/zsh/_randrctl "$pkgdir/usr/share/zsh/site-functions/_randrctl"
  install -Dm644 randrctl/misc/completion/bash/randrctl "$pkgdir/usr/share/bash-completion/completions/randrctl"
  install -Dm644 randrctl/misc/udev/99-randrctl.rules "$pkgdir/usr/lib/udev/rules.d/99-randrctl.rules"
}

# vim:set ts=2 sw=2 et:
