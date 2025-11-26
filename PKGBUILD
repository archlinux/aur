# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname="spritz-wine-bin"
_pkgname=${pkgname%-bin}-tkg
pkgver=10.19
pkgrel=1
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
source=("https://github.com/NelloKudo/spritz-wine-aur/releases/download/${_pkgname}-${pkgver}-${pkgrel}/${_pkgname}-staging-wow64-${pkgver}-${pkgrel}-x86_64.tar.xz")
sha256sums=('15025533f1621cd01618500e0d7f10893a82f208dff86df73ec52bbfdb2f8dbb')

package() {
    # Install to /opt
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/$_pkgname-staging-wow64-$pkgver-$pkgrel" "$pkgdir/opt/"
    
    # Symlink to /usr/bin as 'spritz-wine'
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname-staging-wow64-$pkgver-$pkgrel/bin/wine" "$pkgdir/usr/bin/spritz-wine"
}
