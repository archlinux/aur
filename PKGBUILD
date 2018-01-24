# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>

_pkgname=snf_image_creator
pkgname=snf-image-creator
pkgver=0.11.1
pkgrel=2
pkgdesc="Command line tool for creating images"
url="https://github.com/grnet/snf-image-creator"
arch=('any')
license=('GPL3')
depends=('python2' 'rsync' 'libguestfs' 'python2-pythondialog' 'python2-sendfile'
'python2-progress' 'python2-ansicolors' 'kamaki'  'python2-sh' 'python2-pyparted')
makedepends=('python2-distribute' 'python2-sphinx')
optdepends=('winexe-git: support for Windows images'
            'hivex: support for Windows images')
source=("https://github.com/grnet/$pkgname/archive/$pkgver.tar.gz")

sha256sums=('9d2f9ac93e5858a8ecf8b197da046daba483d5d4acbcf60b3d4390ce73b867a4')

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1

  # Build documentation and man page
  cd "$srcdir/$_pkgname-$pkgver/docs"
  sed -i 's/sphinx-build/sphinx-build2/' Makefile
  make html && make man && rm -rf "_build/html/man" && rm -rf  _build/doctrees

  mkdir -p "$pkgdir"/usr/share/{man/man1,docs/"$pkgname"}
  install -Dm644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"
  cp -r _build/html/ "$pkgdir/usr/share/docs/$pkgname/html"

}
