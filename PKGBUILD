# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com

pkgname=nuvolaplayer-git
pkgver=2015.07.06.c86a837
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
  git log -1 --format="%cd.%h" --date=short | sed 's:-:.:g'
}

build() {
  cd "$pkgname"
  python ./waf configure --prefix=/usr
  LANG='en_US.UTF-8' python ./waf build
}

package() {
  cd "$pkgname"
  python ./waf install --no-system-hooks --destdir="${pkgdir}"
}
