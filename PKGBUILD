# Maintainer: Tim Schubert <tim.schubert@tu-bs.de>
pkgname=texlive-tubs
pkgver=1.1.0
pkgrel=1
pkgdesc="LaTeX-Templates for the Corporate Design of TU Braunschweig"
arch=('any')
url="http://tubslatex.ejoerns.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra')
provides=('texlive-tubslatex')
conflicts=('texlive-tubslatex')
install=texlive-tubs.install
source=("http://tubslatex.ejoerns.de/1.1.0/tubslatex_1.1.0.tds.zip")
md5sums=('3768f97ff43dc5cdf5faa52d42b18dd5')
sha512sums=('bad54c632d0413a98b163fd393d280f68196733d6c34c4d6fed59919075112c96813f56d389ef06fd3f5163328e06b692a0e9df400f27881b42581d9d7ff6f78')

package() {
  cd "$srcdir"
  wanteddirs=$(for d in *; do test -d $d && [[ $d != doc ]] && echo $d; done) || true
  for dir in $wanteddirs; do
    find $dir -type d -exec install -d -m755 $pkgdir/usr/share/texmf-dist/'{}' \;
    find $dir -type f -exec install -m644 '{}' $pkgdir/usr/share/texmf-dist/'{}' \;
  done
}
