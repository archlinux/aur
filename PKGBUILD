# Maintainer: Mike Cuche <mike@cuche.cc>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=qzdl-git
pkgver=3.2.2.3.r114.g82cd0a2
pkgrel=1
pkgdesc="A ZDoom launcher using Qt - git version"
arch=('x86_64')
url="http://zdl.vectec.net"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'hicolor-icon-theme' 'glibc' 'libgcc' 'libstdc++')
optdepends=('uzdoom: Source port that can be used on ZDL'
'dsda-doom: Source port that can be used on ZDL'
'chocolate-doom: Source port that can be used on ZDL'
'crispy-doom: Source port that can be used on ZDL'
)
conflicts=('qzdl')
provides=('qzdl')
makedepends=('git' 'cmake')
source=("git+https://github.com/qbasicer/qzdl.git"
"zdl.desktop")
sha256sums=('SKIP'
            'bd483515ba49b08a60ba7551e9f0b92e4cdb3ace902952f2af35d0608ad51add')

pkgver() {
  cd "$srcdir/${pkgname::-4}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build()
{
 cd "$srcdir"
 cmake -B build -S "${pkgname::-4}" \
 -DCMAKE_BUILD_TYPE=None

 cmake --build build
}

package()
{
   cd "$srcdir"
   install -Dm755 build/zdl "$pkgdir/usr/bin/zdl"
   install -Dm644 qzdl/ico_icon.xpm "$pkgdir/usr/share/pixmaps/zdl.xpm"
   install -Dm644 qzdl/res/zdl3-32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/zdl.png"
   install -Dm644 qzdl/res/zdl3-64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/zdl.png"
   install -Dm644 qzdl/res/zdl3-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/zdl.png"
   install -Dm644 qzdl/res/zdl3-256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zdl.png"
   install -Dm644 qzdl/res/zdl3-512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/zdl.png"
   install -Dm644 qzdl/res/zdl3.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zdl.svg"
   install -Dm644 zdl.desktop "$pkgdir/usr/share/applications/zdl.desktop"
}
