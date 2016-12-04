# Contributor: Slava Ganzin <slava dot ganzin at gmail dot com>
# Contributor: Slava Ganzin <slava dot ganzin at gmail dot com>

pkgname=glove-git
pkgver=71.c0d838f
pkgrel=1
pkgdesc="GloVe model for distributed word representation"
arch=('i686' 'x86_64')
url="https://github.com/stanfordnlp/GloVe"
license=('Apache','2.0')
makedepends=('make' 'gcc' 'git')
provides=('glove')
source=('git://github.com/stanfordnlp/GloVe.git')
md5sums=('SKIP')

_gitname=GloVe
_pkgname=GloVe

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  d="$pkgdir/usr/local/bin"
  install -d $d
  install -m755 cooccur $d
  install -m755 glove $d
  install -m755 vocab_count $d
  install -m755 shuffle $d
}

# vim:ts=2:sw=2:et:
