# Contributor: Kazuo Teramoto <kaz.rag gmail com>
# Contributor: scj <scj archlinux us>
# Contributor: tracer <jcdenton513 gmail com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=orpie
pkgver=1.5.2
pkgrel=11
epoch=
pkgdesc="https://github.com/pelzlpj/orpie"
arch=('i686' 'x86_64')
url="http://pessimization.com/software/orpie/"
license=('GPL')
groups=()
depends=('ncurses' 'gsl')
makedepends=('ocaml' 'gsl' 'camlp4')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pelzlpj/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'mlgsl_sf.patch')
noextract=()
md5sums=('1fd02e75549cca954cebbd13271ea7f5'
         'e54c939635e1aec69f887297dcb3427a')
sha1sums=('9786df20fb272fd36f87868bed04cab504602282'
          'f497570215395340ea8899677d2e828e2a0822b2')
sha256sums=('de557fc7f608c6cb1f44a965d3ae07fc6baf2b02a0d7994b89d6a0e0d87d3d6d'
            '5647572b6cf3b7b12a7ae2727df65ee100f416e33e967e1a4ced62cba878a43e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/gsl"
  patch mlgsl_sf.c $srcdir/mlgsl_sf.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 doc/manual.pdf $pkgdir/usr/share/doc/$pkgname/manual.pdf
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

