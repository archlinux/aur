pkgname=rdis-git
pkgrel=1
pkgver=20140126
pkgdesc="A graphic binary analysis tool. Check rdis-lua for some scripts that improve its functionality. "
arch=(x86_64)
url="https://github.com/endeav0r/rdis"
license=('GPL3')
depends=('gtk3' 'luajit' 'jansson' 'udis86')
source=("git+http://github.com/endeav0r/rdis.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rdis"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "$srcdir/rdis"
  sed -i 's,/usr/bin,$(DESTDIR)&,g' Makefile
  find . -name "Makefile" -exec sed -i 's/-Werror//g' '{}' \;
}

build() {
  cd "$srcdir/rdis"
  make
}

package() {
  cd "$srcdir/rdis"
  install -dm0755 "${pkgdir}"/usr/bin  # badly written Makefile!
  make DESTDIR="${pkgdir}" install
}
