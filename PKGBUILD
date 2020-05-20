# Maintainer: Colin Adler <colin@coder.com>
# Maintainer: Anmol Sethi <anmol@coder.com>

pkgname=code-server
pkgver="3.3.1"
pkgrel=1
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
_dirname="code-server-${pkgver}-linux-amd64"
source=(${url}/releases/download/v${pkgver}/${_dirname}.tar.gz)
sha512sums=('54447ee354f8e083d07785d23839fd37dca86041059f812532f00bd081ed55fa8780802a34ebcaa6270a16378f38e0c1362c425b43d7692324b341fba0ccec0e')
options=('!strip')

package() {
  # Special thanks to @ben0mega and @ava1ar
  cd "$srcdir"/"${_dirname}"
  find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/$pkgname/bin/code-server $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
