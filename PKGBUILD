# Maintainer: fenuks
# Previous maintainer: Ben Oliver <ben@bfoliver.com>

pkgname=bukuserver
pkgver=4.6
pkgrel=2
pkgdesc="Powerful command-line bookmark manager. CLI and server."
arch=('any')
depends=('python' 'python-flask-reverse-proxy-fix' 'python-beautifulsoup4' 'python-cryptography' 'python-urllib3' 'python-certifi' 'python-html5lib' 'python-appdirs' 'python-arrow' 'python-cffi' 'python-click' 'python-flask-admin' 'python-flask-api' 'python-flask-bootstrap' 'python-flask-paginate' 'python-flask-wtf' 'python-idna' 'python-itsdangerous' 'python-jinja' 'python-markupsafe' 'python-packaging' 'python-pyasn1' 'python-pycparser' 'python-requests' 'python-six' 'python-werkzeug')
makedepends=('make')
conflicts=('buku')
provides=('buku')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('2e1968016d3856184db8ac49cdc92a6c70869f62846185f28c8c60ead0c42888')

package() {
  cd "$srcdir/buku-$pkgver"
  python setup.py install --root="${pkgdir}" --prefix=/usr
  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
  gzip -f buku.1
  install -Dm644 buku.1.gz "${pkgdir}/usr/share/man/man1/buku.1.gz"
}
