# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Advaith Madhukar <advaith.madhukar at gmail dot com>
pkgname=sysmon
pkgver=1.0.1
pkgrel=2
pkgdesc="Graphical system monitor. Similar to windows task manager"
arch=('any')
url="https://github.com/MatthiasSchinzel/sysmon"
license=('GPL3')
depends=('python-pyqtgraph' 'python-pyqt5' 'wireless_tools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MatthiasSchinzel/sysmon/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('1364589a57701128a5a0ab095f0a343475ce14be856b37573df41ca3e5786c7c'
            'cc538ea1e439738db3fedf55ef0ab825e27669b8501f99ac58be7245f974bc7e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
