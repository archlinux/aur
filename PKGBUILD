# Maintainer: Reventlov <contact+aur@volcanis.me>
pkgname=0bin-git
pkgver=r209.391df05
pkgrel=2
pkgdesc="A python2 client side encrypted pastebin that can run without a database."
arch=('any')
url="https://0bin.readthedocs.org/en/latest/"
license=('WTFPL')
depends=('python2' 'python2-setuptools' 'python2-bottle' 'python2-cherrypy' 'python2-clize' 'python2-privilege')
makedepends=('git')
backup=('usr/lib/python2.7/site-packages/zerobin/default_settings.py')
source=("$pkgname"::'git+https://github.com/sametmax/0bin.git' 'LICENSE' 'zerobin.install' 'zerobin.service')
md5sums=('SKIP'
         '1b71aebc25e7533ebaa5b320a20e7ed2'
         'fe5002a67ee21f5cd66f6d8f709607bc'
         'a8650e18bde8928f49c1d4cd6e0327be')
pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

package() {
   msg "Starting build..."
   cd "$srcdir/$pkgname"
   python2 setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 ../zerobin.service "${pkgdir}"/usr/lib/systemd/system/zerobin.service
}
