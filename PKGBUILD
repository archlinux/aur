# Maintainer: edio <edio@archlinux.us>

_gitname=randrctl
pkgname=$_gitname-git
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.7.1.r6.895dee6
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPLv3')
makedepends=('git' 'python-pip')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=(
  'git+https://github.com/edio/randrctl.git'
  'completion'
)
md5sums=(
  'SKIP' 
  '0557733f74c7724ac0680e6166807b83'
)
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

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/completion" "$pkgdir/usr/share/bash-completion/completions/randrctl"
  install -Dm644 "randrctl/misc/99-randrctl.rules" "$pkgdir/usr/lib/rules.d/99-randrctl.rules"
}

# vim:set ts=2 sw=2 et:
