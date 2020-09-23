# Maintainer: Jonathon Fernyhough <jonathon+m2x dev>
# Contributor: Jon Gjengset <jon@thesquareplanet.com> (coz-git)

pkgname=coz
pkgver=0.2.2
pkgrel=2
pkgdesc="A new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('BSD')
depends=(libelfin python)
makedepends=(python-docutils)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        python3.diff)
b2sums=('7fca65148f0542c939ea7aae0a9711435f75fb0afebf1b8b0db0a2a5783be9c29236f970c4a3b11bf0583ae3c5f695c4222b3b705c404d97255fc2bba963731f'
        '06a5e526ac7da3b4aec10664b296193faeef0e9c53cfcb9004696ed9fd008a7fb0f8f7310bdf9fc2fbef0239b189f7cecfdf793dbfccf9deee3ed767e2b67671')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../python3.diff
}

build() {
  cd $pkgname-$pkgver
  make
}

#check() {
#  cd $pkgname-$pkgver
#  make bench_small
#}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" install

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
