# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Johannes Fürmann 

pkgname=py3status-git
pkgver=3.54.r3.gbbe43bce
pkgrel=1
pkgdesc="An extensible i3status replacement/wrapper written in python (development version)"
url="https://github.com/ultrabug/py3status"
arch=('any')
license=('BSD')
conflicts=('py3status')
provides=('py3status')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch')
optdepends=('i3status: for i3status modules'
            'i3blocks: for i3blocks modules'
            'iw: for the wifi module'
            'python-mpris2: for the mpris module'
            'python-pyudev: for udev event monitoring'
            'python-pydbus: for modules that rely on D-Bus'
            'python-pytz: for the clock module'
            'python-tzlocal: for the clock module'
            'pacman-contrib: for the arch_updates module')
source=("git+https://github.com/ultrabug/py3status.git")
sha256sums=('SKIP')

pkgver() {
  cd py3status
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
  cd py3status
  git clean -dfx
}

build() {
  cd py3status
  python -m build --wheel --no-isolation
}

package() {
  cd py3status
  python -m installer --destdir="$pkgdir" dist/*.whl
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/user-guide/* README.md CHANGELOG "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
