# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
# Upstream: Immersed Inc. <info at immersedvr dot com>
pkgname=immersed
pkgver="1.7.0"
pkgrel=1
pkgdesc="Immersed Agent"
arch=("x86_64")
url="https://immersedvr.com/"
license=('unknown')
depends=("libpng" "curl" "libva")
source=("https://immersedvr.com/dl/Immersed_amd64.deb")
noextract=("Immersed_amd64.deb")
md5sums=('8eae4a02c76264543937fe2754192cc4')

prepare() {
    ar p Immersed_amd64.deb data.tar.xz | tar Jx

    sed -i "s/Exec=.*/Exec=\/usr\/bin\/immersed %u/g" $srcdir/usr/share/applications/immersed-handler.desktop
}

package() {
    mkdir -p $pkgdir/usr/local
    mkdir -p $pkgdir/usr/share/

    cp -r $srcdir/usr/local/bin $pkgdir/usr/local/
    cp -r $srcdir/usr/share/applications $pkgdir/usr/share/
}
