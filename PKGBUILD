# Maintainer: Colin Adler <colin@coder.com>

pkgname=code-server
pkgver="3.2.0"
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_dirname="code-server-${pkgver}-linux-${arch}"
source=(${url}/releases/download/${pkgver}/${_dirname}.tar.gz)
sha512sums=('9304ec84bae876977b553fcb562084a1b2fc174661549801d8d95b80d7e8e1d0c815ea8d2ab6af3d32b86d2ce37e458a16c1bfd3b37c842d791925b7ad835388')
options=('!strip')

package() {
  # Special thanks to @ben0mega
  cd "$srcdir"/"${_dirname}"
  find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  mkdir -p $pkgdir/usr/bin/
  ln -s $pkgdir/opt/$pkgname/code-server $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
