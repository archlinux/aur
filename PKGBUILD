# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.7.0
pkgrel=1
pkgdesc="Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('APACHE-2.0')
provide=('cayley')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('f2a467d97134a54a7e413e3998b616e3f2062c35fff0132552a80a90004dd1ab')
sha256sums_x86_64=('dd8869f4aad398dd3725882b8923bb5eac74080a43890e3dcfd26f2ef41eb2dd')

if [ "$CARCH" == 'x86_64' ]; then
    _dir="${pkgname}_${pkgver}_linux_amd64"
elif [ "$CARCH" == 'i686' ]; then
    _dir="${pkgname}_${pkgver}_linux_386"
fi

package() {
  cd "$_dir" || exit 1
  install -Dm755 cayley "$pkgdir/usr/bin/cayley"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  rm cayley LICENSE
  cp -r ./* "$pkgdir/usr/share/doc/$pkgname/"
}
