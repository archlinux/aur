# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jason Stryker <public at jasonstryker dot com>
pkgname=protontricks-git
pkgver=1.10.5.r11.g68f965f
pkgrel=1
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games."
arch=('any')
url="https://github.com/Matoking/protontricks"
license=('GPL-3.0-or-later')
depends=('python-pillow' 'python-setuptools' 'python-vdf' 'winetricks')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm'
             'python-wheel')
optdepends=('yad: for GUI'
            'zenity: fallback for GUI')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Matoking/protontricks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove protontricks-desktop-install, since we already install
  # desktop files properly
  rm "$pkgdir/usr/bin/${pkgname%-git}-desktop-install"
}
