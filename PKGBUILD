# Maintainer: Reventlov <contact+aur@volcanis.me>
pkgname=isso
pkgver=0.9.9
pkgrel=1
pkgdesc="A commenting python server similar to disqus"
arch=('any')
url="http://posativ.org/isso/"
license=('MIT')
depends=('python-werkzeug' 'python-html5lib' 'python-misaka' 'python-itsdangerous' 'python-six' 'sqlite' 'python-setuptools')
makedepends=('git' 'python')
backup=('etc/conf.d/isso')
source=("https://pypi.python.org/packages/source/i/isso/isso-$pkgver.tar.gz" 
"https://pypi.python.org/packages/source/i/isso/isso-$pkgver.tar.gz.asc"
"isso.service"
"isso.conf"
"LICENSE")
install=$pkgname.install
validpgpkeys=("7757B21C0C6E5AE4BC6F6462FD1BA15E0E87FE5C")
noextract=()
sha1sums=('b6fa8b1c05e1edcd2089c1512ce6f8e0cd2acdaa'
          'SKIP'
          'f3ca306eee19b55b14b791c728e4c57d6fd4a970'
          'aed76333e2abcfe6e977965444de8f23596d533d'
          '71e993a27a10d294a2c0bef68eaba039e1d46916')
package() {
  msg "Starting build..."
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d -g 1337 -o 1337 "${pkgdir}"/var/lib/isso

  # ... systemd
  install -D -m 644 "${srcdir}"/isso.service  "${pkgdir}"/usr/lib/systemd/system/isso.service
  # ... common config
  install -D -m 644 "${srcdir}"/isso.conf "${pkgdir}"/etc/conf.d/isso

}

# vim:set ts=2 sw=2 et:
