# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=postfix-mta-sts-resolver
pkgver=0.1.4
pkgrel=2
pkgdesc="Daemon for MTA-STS policy enforcement for postfix"
arch=('any')
url="https://github.com/Snawoot/postfix-mta-sts-resolver"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-aiodns' 'python-pyaml'
         'python-pynetstring')
makedepends=('python-pip')
optdepends=('python-uvloop: For faster event loop handling')
source=("https://github.com/Snawoot/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('742ca26831bbe9a5e307bf39c5dc2efcd6014574ef8f5320dba7e54b8f06ba7e'
            'SKIP')
validpgpkeys=('8EE97E32515D051898B1864AF6C5633BE5DE7127')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d -m0755 "$pkgdir/etc/postfix/"
  install -m0644 mta-sts-daemon.yml.example "$pkgdir/etc/postfix/mta-sts-daemon.yml"
}
