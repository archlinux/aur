# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=jasmin
pkgver=2.4
pkgrel=1
pkgdesc='Assembler for the Java Virtual Machine'
url='http://jasmin.sourceforge.net/'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
arch=('i686' 'x86_64')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.zip"
        'http://jasmin.sourceforge.net/xt.html'
        "$pkgname-$pkgver.patch"
        "$pkgname")
sha256sums=('eaa10c68cec68206fd102e9ec7113739eccd790108a1b95a6e8c3e93f20e449d'
            'e7ed5643689a9660345ceb7dae8ce2c10ca8481f8d8ab53f26bb27022c5669b0'
            'c0cc10c30f3a46cd3a9f9923de088dea29067fd372091e076c78273eacec6082'
            'ff12a47ae172ee5dc288684511e91025398e2c8dd2bca5426dabcfab355d2a37')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ant "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 "$pkgname.jar" "$pkgdir/usr/share/java/$pkgname.jar"
  install -d "$pkgdir/usr/share/jasmin/"
  cp -R docs "$pkgdir/usr/share/$pkgname/"
  install -Dm644 ../xt.html "$pkgdir/usr/share/$pkgname/docs"
  install -Dm755 "../$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
