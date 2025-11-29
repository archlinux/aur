# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname="spritz-wine-bin"
_pkgname=${pkgname%-bin}-tkg
pkgver=10.20
pkgrel=1
buildrel=1
pkgdesc="A compatibility layer for running Windows programs, with experimental custom patches for games (doesn't conflict with other Wine installations)"
url="https://github.com/NelloKudo/spritz-wine-aur"
license=(LGPL)
arch=('x86_64')
depends=(
    'attr'                  'desktop-file-utils'
    'fontconfig'            'freetype2'
    'gcc-libs'              'gettext'
    'glib2'                 'glibc'
    'libpcap'               'libunwind'
    'libx11'                'libxcursor'
    'libxext'               'libxi'
    'libxkbcommon'          'libxrandr'
    'systemd-libs'          'wayland'
)
source=("https://github.com/NelloKudo/spritz-wine-aur/releases/download/${_pkgname}-${pkgver}-${buildrel}/${_pkgname}-staging-wow64-${pkgver}-${buildrel}-x86_64.tar.xz")
sha256sums=('12e9509116d223fd37ed5049fbfda23f7618ceeacab5eca244fb755a78130371')

package() {
    # Install to /opt
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/$_pkgname-staging-wow64-$pkgver-$buildrel" "$pkgdir/opt/$_pkgname"
    
    # Symlink to /usr/bin as 'spritz-wine'
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/bin/wine" "$pkgdir/usr/bin/spritz-wine"
}
