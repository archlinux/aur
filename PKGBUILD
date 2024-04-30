# Maintainer: Wolfizen <wolfizen@wolfizen.net>
# Contributor: Narrat <autumn-wind@web.de>
# Contributor: itsme <mymail@ishere.ru>

pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.9.0
pkgrel=2
arch=('any')
url="http://github.com/koiuo/randrctl"
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr' 'python-wheel')
depends=('python' 'python-argcomplete' 'python-yaml' 'xorg-xrandr')
optdepends=('bash-completion: bash shell prompt auto-completions')
install="randrctl.install"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/koiuo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('aa5d20dea6c3bef3c3e92cb14569e2e3f8e8c0a44a0467c0d31e1931c6729431')


build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  python -m randrctl setup completion > bash_completion

  install -Dm644 randrctl/setup/config.yaml "$pkgdir/etc/randrctl/config.yaml"
  install -Dm644 randrctl/setup/99-randrctl.rules "$pkgdir/usr/lib/udev/rules.d/99-randrctl.rules"
  install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/randrctl"
}

# vim:set ts=2 sw=2 et:
