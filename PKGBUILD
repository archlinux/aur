# Maintainer: aksr <aksr at t-com dot me>
pkgname=tr2latex
pkgver=2.4
pkgrel=2
epoch=
pkgdesc="Translate troff source to LaTeX"
arch=('i686' 'x86_64')
url="http://www.ctan.org/tex-archive/support/tr2latex"
license=('custom:publicdomain')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=tr2latex.install
changelog=
source=(http://www.ctan.org/tex-archive/support/$pkgname.zip
        tr2latex.install)
noextract=()
options=()
md5sums=('e5b6e9181ff76c7ad8d631feafce5123'
         '22f91ab6cca2a3dd7d593991584c4b06')
sha1sums=('02a11aa0221618ea4a3890571db6fae95955c399'
          '7e7a946e2c21387134800fe48c4629bf2710e40a')
sha256sums=('6623d6e3db5116d38ca37bad24376277416bc567de61df3f6ef928bf6bb04019'
            '0bfb3b50155ece0b119a7166202d17b1ff6f01ac3228a8baca9c3c903a331f1e')

build() {
  cd "$srcdir/$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k testfile.tex
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" \
       TEXDIR="$pkgdir/usr/share/texmf-dist/tex/latex/$pkgname" install

  ## a quick-and-ugly™ hack to create a license file:
  sed '5,21!d' README > LICENSE
  sed '24,33!d' README >> LICENSE
  sed '52,56!d' README >> LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

