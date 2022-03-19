# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=darbup
pkgver=20131117
pkgrel=2
pkgdesc="Wrapper around the excellent dar archiver tool to do regular backup"
url="https://github.com/c4rlo/darbup"
arch=('any')
license=('GPL3')
depends=('python' 'dar')
source=(git+$url.git#commit=6611648dabcdc78e4ecb5c9950ad0a3ffcc8eda2)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}
  
package() {
  cd $pkgname
  _Majorver=$(python --version|cut -d. -f1-2| cut -d " " -f2)
  install -d "$pkgdir"/usr/lib/python/$_Majorver/site-packages/$pkgname
  for _file in *.py
  do
    install -m644 $_file "$pkgdir"/usr/lib/python/${_Majorver}/site-packages/$pkgname
  done
  chmod 755 "$pkgdir"/usr/lib/python/${_Majorver}/site-packages/$pkgname/__main__.py
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/python/${_Majorver}/site-packages/$pkgname/__main__.py "$pkgdir"/usr/bin/$pkgname
}
