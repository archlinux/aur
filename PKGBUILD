# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.6.1
pkgrel=1
pkgdesc="Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('APACHE-2.0')
provide=('cayley')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_v${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_v${pkgver}_linux_386.tar.gz")
md5sums_i686=('b583dac7345345fe7c7e55bedb9c26c0')
md5sums_x86_64=('481b02529eaae96d99b9b7133c58500a')

if [ "$CARCH" == 'x86_64' ]; then
    _dir="${pkgname}_v${pkgver}_linux_amd64"
elif [ "$CARCH" == 'i686' ]; then
    _dir="${pkgname}_v${pkgver}_linux_386"
fi

package() {
  cd "$_dir" || exit 1
  install -Dm755 cayley "$pkgdir/usr/bin/cayley"
  install -Dm755 cayleyupgrade "$pkgdir/usr/bin/cayleyupgrade"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  rm cayley cayleyupgrade LICENSE
  cp -r ./* "$pkgdir/usr/share/doc/$pkgname/"
}
