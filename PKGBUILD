# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmon-git
pkgver=1.0.1.r0.g9d5b2d8
pkgrel=1
pkgdesc="Graphical system monitor. Similar to windows task manager."
arch=('any')
url="https://github.com/MatthiasSchinzel/sysmon"
license=('GPL3')
depends=('python-pyqtgraph' 'python-pyqt5' 'wireless_tools')
makedepends=('git' 'python-setuptools')
optdepends=('nvidia-utils: NVIDIA GPU utilization and clock speed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/MatthiasSchinzel/sysmon.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'cc538ea1e439738db3fedf55ef0ab825e27669b8501f99ac58be7245f974bc7e')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}/src"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}/src"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
}
