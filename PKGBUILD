# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

_gitname=randrctl
pkgname=$_gitname-git
pkgdesc="Lightweight profile based screen manager for X"
pkgver=r28.7297e20
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPLv3')
makedepends=('git')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=('git+https://github.com/edio/randrctl.git')
md5sums=('SKIP')
provides=("$_gitname")
conflicts=("$_gitname")

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 etc/randrctl/config.ini "$pkgdir/etc/randrctl/config.ini"
  install -Dm644 etc/randrctl/profiles/examples/default "$pkgdir/etc/randrctl/profiles/examples/default"
  install -Dm644 etc/completion/randrctl.zsh "$pkgdir/usr/share/zsh/site-functions/_randrctl"
  install -Dm644 etc/completion/randrctl.bash "$pkgdir/usr/share/bash-completion/completions/randrctl"
  install -Dm644 etc/udev/rules.d/99-randrctl.rules "$pkgdir/usr/lib/udev/rules.d/99-randrctl.rules"
}

# vim:set ts=2 sw=2 et:
