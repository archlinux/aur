# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=thanos-xfdesktop-gtk3
_pkgname=xfdesktop
pkgver=4.13.2
pkgrel=1
pkgdesc="A desktop manager for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk3')
depends=('exo-gtk3'
    'garcon-gtk3'
    'hicolor-icon-theme'
    'libwnck3'
    'libxfce4ui-gtk3')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('thunar-gtk3')
conflicts=('xfce4-menueditor' "$_pkgname")
provides=("$_pkgname")
replaces=('xfce4-menueditor')
_commit=9ec7efe27233962906cc734dec54b5e1c4de3b1f
source=(https://git.xfce.org/xfce/xfdesktop/snapshot/xfdesktop-$_commit.tar.bz2)
sha256sums=('2b7806dc6bb9c74cbbd9d7ee71cc71e6384eeb5ee578f0195433391a8164a29c')

prepare() {
  cd "$srcdir/$_pkgname-$_commit"
}

build() {
  cd "$srcdir/$_pkgname-$_commit"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-thunarx \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$_commit"
  make DESTDIR="$pkgdir" install
}
