# Maintainer: Harrison Oates <harrison at harrisonoates dot com>
# Upstream: Immersed Inc. <info at immersedvr dot com>
pkgname=immersed
pkgver=1.9.0
pkgrel=1
pkgdesc="Immersed Agent"
arch=("x86_64")
url="https://immersedvr.com/"
license=('unknown')
depends=("libpng" "curl" "libva")
source=("https://immersed.com/dl/Immersed-x86_64.AppImage")
noextract=("Immersed-x86_64.AppImage")
md5sums=('297a9bd4a7f04b3a51bffcbe6e667d98')

pkgver() {
    ar p Immersed_amd64.deb control.tar.gz | tar zx ./control -O | grep "Version" | sed 's/^Version: \([0-9.]*\)$/\1/g'
}

prepare() {
    ar p Immersed_amd64.deb data.tar.xz | tar Jx

    sed -i "s/Exec=.*/Exec=\/usr\/bin\/immersed %u/g" $srcdir/usr/share/applications/immersed-handler.desktop
}

package() {
    mkdir -p $pkgdir/usr/local
    mkdir -p $pkgdir/usr/share/

    cp -r $srcdir/usr/local/bin $pkgdir/usr/local/
    cp -r $srcdir/usr/share/applications $pkgdir/usr/share/
    mv $pkgdir/usr/local/bin/Immersed $pkgdir/usr/local/bin/immersed
}
