# Maintainer: Julius Dehner <julius.dehner@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_langs=(jpn_vert)

pkgbase=tesseract-data-jpn_vert-git
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}-git; done))
pkgver=44.4767ea9
pkgrel=1
pkgdesc="Trained language data for tesseract OCR Engine"
arch=('i686' 'x86_64')
url="https://github.com/tesseract-ocr/tessdata"
license=('Apache')
depends=('tesseract')
groups=('tesseract-data-git')
source=('tessdata::git+https://github.com/tesseract-ocr/tessdata.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tessdata"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

for l in ${_langs[@]}; do
    eval "
package_tesseract-data-${l}-git(){
    provides=('tesseract-data-${l}')
    conflicts=('tesseract-data-${l}')

    cd \"\$srcdir/tessdata\"
    mkdir -p \"\$pkgdir/usr/share/tessdata\"
    cp ${l}.* \"\$pkgdir/usr/share/tessdata/\"
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done

