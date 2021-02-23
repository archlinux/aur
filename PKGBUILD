# Maintainer: Julius Dehner <julius.dehner@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_langs=(jpn_vert)

pkgbase=tesseract-data-best-jpn_vert-git
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-best-${l}-git; done))
pkgver=37.e2aad9b
pkgrel=1
pkgdesc="Trained language data for tesseract OCR Engine"
arch=('i686' 'x86_64')
url="https://github.com/tesseract-ocr/tessdata_best"
license=('Apache')
depends=('tesseract')
groups=('tesseract-data-git')
source=('tessdata::git+https://github.com/tesseract-ocr/tessdata_best.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tessdata"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

for l in ${_langs[@]}; do
    eval "
package_tesseract-data-best-${l}-git(){
    provides=('tesseract-data-best-${l}')
    conflicts=('tesseract-data-best-${l}')

    cd \"\$srcdir/tessdata\"
    mkdir -p \"\$pkgdir/usr/share/tessdata\"
    cp ${l}.* \"\$pkgdir/usr/share/tessdata/\"
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done

