# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=lingot
pkgver=1.1.0
pkgrel=1
pkgdesc='A musical instrument tuner'
url='http://www.nongnu.org/lingot/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('perl-xml-parser' 'intltool')
source=("https://download.savannah.gnu.org/releases/lingot/$pkgname-$pkgver.tar.gz"
        'https://github.com/ibancg/lingot/commit/d47be66c4ea0ab2967aa1cb7c4f8e3daf0c7786f.patch'
        'fix_build.patch')

sha256sums=('78bb5c5ab6dc0a8fb223b377ec029e1a3e2227ea8d3a0eb54e7ad500b69c7818'
            '0b82e5473ca4b8b9d7bf6ab0c22d8f1c458d1dbad34a92cf2f4183873174765c'
            'f728003d62a4943dd00842b6cfbb27d5b61e9c7b4db97238046022fb3e915c79')

prepare() {
  cd "$pkgname-$pkgver"
  # Fix JACK
  patch -p1 -i "$srcdir/d47be66c4ea0ab2967aa1cb7c4f8e3daf0c7786f.patch"
  # Fix build: combines two patches without bumping version https://github.com/ibancg/lingot/commit/14ff1d2c872b304be04aabcfc7a51cdefed43293.patch https://github.com/ibancg/lingot/commit/e6debb9e29fec0051251dfd61e1d88779b207218.patch
  patch -p1 -i "$srcdir/fix_build.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
