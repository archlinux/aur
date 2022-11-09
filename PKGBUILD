# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=postfix-mta-sts-resolver
pkgver=1.1.4
pkgrel=1
pkgdesc="Daemon for MTA-STS policy enforcement for postfix"
arch=('any')
url="https://github.com/Snawoot/postfix-mta-sts-resolver"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-aiodns' 'python-yaml'
         'python-pynetstring' 'python-sdnotify')
makedepends=('python-pip')
optdepends=('python-uvloop: For faster event loop handling'
            'python-aiosqlite: For sqlite cache support')
source=("https://github.com/Snawoot/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
       "postfix-mta-sts-resolver.install")
sha256sums=('def07a92bb0fe86db96ef886dbb408fbd37224dd9828e3a63392a129472524f7'
            'SKIP'
            '7dc78a1ad5620789bf230592fec93fca97f57827ef933f91c8c6e1b44ce8f5d5')
validpgpkeys=('8EE97E32515D051898B1864AF6C5633BE5DE7127')
install=$pkgname.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d -m0755 "$pkgdir/etc/postfix/"
  install -m0644 config_examples/mta-sts-daemon.yml.internal \
          "$pkgdir/etc/mta-sts-daemon.yml"
  install -d -m0755 "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.redis \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.sqlite \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.sqlite_unixsock \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
}
