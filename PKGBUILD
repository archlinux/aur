# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jason Stryker <public at jasonstryker dot com>
pkgname=protontricks-git
pkgver=1.9.1.r2.gaea43f7
pkgrel=1
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games."
arch=('any')
url="https://github.com/Matoking/protontricks"
license=('GPL3')
depends=('python-setuptools' 'python-vdf' 'steam' 'winetricks')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
optdepends=('yad: for GUI'
            'zenity: fallback for GUI')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Matoking/protontricks.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove protontricks-desktop-install, since we already install
  # desktop files properly
  rm "$pkgdir/usr/bin/${pkgname%-git}-desktop-install"
}
