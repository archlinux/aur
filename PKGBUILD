# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=0.19
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL')
depends=('python' 'git')
makedepends=('xmlto' 'asciidoc')
source=(
  "https://github.com/ctmarinas/stgit/archive/v${pkgver}.tar.gz"
)
sha256sums=('746f043c8a7caf5e675ef9d5c894a4a0a7d581ad4244747512f5efcccfbac5ff')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make doc
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --prefix=/usr
  chmod 644 "$pkgdir"/usr/share/stgit/{completion/stgit-completion.bash,contrib/stgbashprompt.sh}
  for manpage in ./Documentation/*.1; do
    install -D -m644 $manpage "$pkgdir"/usr/share/man/man1/$(basename $manpage)
  done
}
