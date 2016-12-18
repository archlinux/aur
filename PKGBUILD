# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Maintainer: Steven Allen <steven@stebalien.com>

_pkgname=pithos
pkgname=$_pkgname-git
pkgver=1.2.1.r28.g5bc9671
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'libappindicator-gtk3: Unity indicator applet support'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'python-systemd: Logging to the system journal')
makedepends=('git' 'automake' 'autoconf' 'intltool' 'appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname-bzr" "$_pkgname")
sha256sums=('SKIP')
source=('git+https://github.com/pithos/pithos.git')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" make install
}
