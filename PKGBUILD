# Contributor: Mark Grimes <mgrimes at peculier dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: macxcool

pkgname=stopmotion
_realname=linuxstopmotion
pkgver=0.8.5
pkgrel=1
arch=(x86_64)
pkgdesc="Stop motion animation creation program"
url="http://linuxstopmotion.org/"
license=(GPL2)
depends=(hicolor-icon-theme libtar qt5-multimedia)
makedepends=(git qt5-tools)
_commit=ed010826d9ae7668d5d477c47a10e4fb1b92ecf8  # tags/0.8.5
source=($_realname::git+https://git.code.sf.net/p/$_realname/code#tag=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $_realname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_realname
  sed -i 's|/share/icons|/share/icons/hicolor/scalable/apps/|' stopmotion.pro
}

build() {
  cd $_realname
  qmake PREFIX=/usr stopmotion.pro
  make
}

package() {
  cd $_realname
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 stopmotion.mime "$pkgdir"/usr/share/mime-info/stopmotion.mime
  install -Dm644 stopmotion.1 "$pkgdir"/usr/share/man/man1/stopmotion.1
}
