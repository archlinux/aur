# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>
pkgname=groovyserv
pkgver=1.2.0
pkgrel=1
pkgdesc='Groovy startup acceralator'
arch=('x86_64')
url="https://github.com/kobo/$pkgname"
license=('Apache')
makedepends=('go-pie' 'gradle' 'unzip')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("25f87571271317ff7e4ed05dc52eaaf04500f58cabf60f8d35c3d8fc9b0c3a7fce9be4f1e6585b3689cef21bf9b621b98ebce4de8ad927869636ce4f1557b229")

build() {
  cd $pkgname-$pkgver
  ./gradlew clean distLocalBin
  unzip build/distributions/$pkgname-$pkgver-bin-local.zip
}

package() {
  mkdir -p $pkgdir/opt $pkgdir/usr/bin
  cp -Rp $pkgname-$pkgver/$pkgname-$pkgver/ $pkgdir/opt/$pkgname
  for file in groovyserver groovyclient ; do
    ln -s /opt/$pkgname/bin/$file $pkgdir/usr/bin
  done
}
