# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cayley
pkgver=0.7.1
pkgrel=1
pkgdesc="Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph."
arch=('i686' 'x86_64')
url='https://cayley.io/'
license=('APACHE-2.0')
provide=('cayley')
source_x86_64=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_amd64.tar.gz")
source_i686=("https://github.com/cayleygraph/cayley/releases/download/v${pkgver}/cayley_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('ab1f32ca3501f8c86145c7ec7c29e44cc02c19adfdf511b347c3ff7bb47739b9')
sha256sums_x86_64=('77cbd2a3112ce4db414208839e7181b964d71a9495f21da06cbe7e2957c334f5')

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
