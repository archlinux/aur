# Maintainer: Marian Patrik Felder <echo Y29kZUBtYXJpYW4tZmVsZGVyLmRlCg== | base64 -d>

pkgname=xdg-desktop-portal-xapp-bin
pkgver=1.0.1
_pkgver="$pkgver-1.0.1"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="XDG-DESKTOP-PORTAL for Cinnamon/MATE/Xfce4"
url="https://github.com/linuxmint/xdg-desktop-portal-xapp"
license=('LGPL-2.1+')
depends=('xdg-desktop-portal')
source=('https://github.com/linuxmint/xdg-desktop-portal-xapp/releases/download/master.mint21/packages.tar.gz')
sha512sums=('30c999a58dbdfb890d95351ca746750dd6ddf88541e0122f5de073d8f66671900ac65cc1cece22ce21d3cb9fba5a992200e410ca6e386a2ff30c5b321f6cb3fd')

package() {
    pushd $srcdir
    tar -C "$srcdir" -xf "packages.tar.gz" packages/xdg-desktop-portal-xapp_${pkgver}_amd64.deb
    ar --output "$srcdir" x "$srcdir/packages/xdg-desktop-portal-xapp_${pkgver}_amd64.deb" "data.tar.xz"
    popd
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    grep -lr "/usr/libexec" "$pkgdir" | xargs sed -i 's@/usr/libexec@/usr/bin@g'
    mv $pkgdir/usr/{libexec,bin}
}
