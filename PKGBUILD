# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com

pkgname=nuvolaplayer-git
pkgver=3.0.0.r25.g8329274
pkgrel=1
pkgdesc="Cloud music integration for your Linux desktop."
arch=('i686' 'x86_64')
url="https://tiliado.eu/nuvolaplayer/"
license=('GPL')
makedepends=('git' 'python')
depends=('diorite-git' 'vala' 'webkit2gtk' 'libarchive' 'gtk3' 'libnotify' 'json-glib')
source=("$pkgname::git://github.com/tiliado/nuvolaplayer")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd "$pkgname"
  python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
