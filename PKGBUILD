# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sysmon-git
pkgver=1.0.1.r0.g9d5b2d8
pkgrel=3
pkgdesc="Graphical system monitor. Similar to windows task manager."
arch=('any')
url="https://github.com/MatthiasSchinzel/sysmon"
license=('GPL3')
depends=('python-pyqtgraph' 'python-pyqt5' 'wireless_tools')
makedepends=('git' 'python-build' 'python-installer'  'python-setuptools' 'python-wheel')
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
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}/src"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
}
