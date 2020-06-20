# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pwncat-git
pkgver=0.0.22.alpha.r0.gf0e70d6
pkgrel=1
pkgdesc='Netcat on steroids with Firewall, IDS/IPS evasion, bind and reverse shell, self-injecting shell and port forwarding magic - and its fully scriptable with Python (PSE)'
arch=('any')
url='https://cytopia.github.io/pwncat'
license=('MIT')
provides=('pwncat')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("pwncat::git+https://github.com/cytopia/pwncat")
sha256sums=('SKIP')

pkgver() {
  cd pwncat
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pwncat
  python setup.py build
  gzip --force man/pwncat.1
}

package() {
  cd pwncat
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 man/pwncat.1.gz -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et: