# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
_pkgname=vdirsyncer
pkgver=0.16.1
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('BSD')
replaces=('python2-vdirsyncer')
provides=('python2-vdirsyncer')
depends=('python-click' 'python-setuptools'
         'python-requests-toolbelt' 'python-atomicwrites'
         'python-click-threading' 'python-click-log')
makedepends=('python-setuptools-scm')
optdepends=('python-requests-oauthlib: Google support')
checkdepends=('python-pytest' 'python-wsgi-intercept'
              'radicale' 'python-pytest-xprocess' 'python-pytest-localserver'
              'python-hypothesis' 'python-pytest-subtesthack')
source=("https://pypi.io/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pimutils/vdirsyncer/${pkgver}/contrib/vdirsyncer.service"
        "https://raw.githubusercontent.com/pimutils/vdirsyncer/${pkgver}/contrib/vdirsyncer.timer")
md5sums=('c379b4762b0a6301d941e8e56f6494ac'
         '749db7df09404e77ee249b0f8c8636b9'
         'bcc302fb3a6552a41acc1c82fba688f5')

check() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make test
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/vdirsyncer.service" "$pkgdir/usr/lib/systemd/user/vdirsyncer.service"
  install -Dm 644 "$srcdir/vdirsyncer.timer" "$pkgdir/usr/lib/systemd/user/vdirsyncer.timer"
}
