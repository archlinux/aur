# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria-git
pkgver=2024.05.31.r3.g01cdfee53
pkgrel=1
epoch=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (dev channel)"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    "python-chardet: to detect encoding of incoming IRC lines, if they are not in UTF-8"
    "python-gnupg: for authenticated based on GPG tokens"
    "python-pysocks: for SOCKS proxy (IRC via Tor)"
    "python-cryptography: Fediverse plugin support"
    "python-feedparser: RSS plugin support"
    "python-dateutil: enable fancy time string parsing in the Time plugin")
conflicts=('limnoria')
provides=('limnoria')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/master-([0-9-]+)-([0-9]+)-g(.+)/\1.r\2.g\3/;s/-/./g'
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
