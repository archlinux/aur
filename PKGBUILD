# Maintainer: edio <edio@archlinux.us>

_gitname=randrctl
pkgname=$_gitname-git
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.8.0.r1.ad847b3
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('git' 'python-pip' 'python-pbr')
depends=('python' 'python-argcomplete' 'python-setuptools' 'python-yaml' 'xorg-xrandr')
optdepends=('bash-completion')
source=(
  'git+https://github.com/edio/randrctl.git'
  'completion'
)

md5sums=('SKIP'
         '3d815420a33e62aa25b011f19d812a07')

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
  install -Dm644 "randrctl/setup/99-randrctl.rules" "$pkgdir/usr/lib/rules.d/99-randrctl.rules"
}

# vim:set ts=2 sw=2 et:
