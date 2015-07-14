# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: Mitchell Nemitz <mitchell.nemitz@gmail.com>
pkgname=xdg-su-git
pkgver=1.2.3.r0.g5c1f1f5
pkgrel=1
pkgdesc="Run a program as root with a graphical interface"
epoch=1
arch=('any')
url="https://github.com/tarakbumba/xdg-su"
license=('MIT')
makedepends=('links' 'xmlto' 'git' 'docbook-xsl')
provides=('xdg-su')
conflicts=('xdg-su')
depends=('bash')
source=("$pkgname::git+https://github.com/tarakbumba/xdg-su.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^xdg-su-//;s/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
