# Maintainer:  Ainola

pkgname=nuclear-throne-hib
pkgver=20160815
pkgrel=2
pkgdesc="Action roguelike-like about mutants that spend their workdays trying to fight for the throne in a post-apocalyptic world."
arch=('i686' 'x86_64')
url="http://nuclearthrone.com"
license=('custom: commercial')
makedepends=('unzip')
depends_i686=('openal' 'glu' 'openssl' 'libxxf86vm' 'libxrandr')
depends_x86_64=('lib32-openal' 'lib32-glu' 'lib32-openssl'
                'lib32-libxxf86vm' 'lib32-libxrandr')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("hib://nuclearthrone-linux.zip"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('7834649060d8c0d50e976555617d49ae7c0787d1570c1768395ad4c04bd9f77b'
            '673fc3ff551fac28fced5386e9642019cc5dde1dbd44af0a8407a38eb4cdd9a2'
            '5e837c75f2a539a5c11a3abd41c9d2314668d5c5ae2443a332deecd63554478c')

# Prevent compressing final package
PKGEXT='.pkg.tar'

# You need to download the Humble Bundle file manually or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, hib-dlagent (https://aur.archlinux.org/packages/hib-dlagent/)
# can be used to download files. Add something like this in your makepkg.conf
# (you need to tweak the options to your needs):
# DLAGENTS+=('hib::/usr/bin/hib-dlagent -k $KEY -u $USER -p $PASS -o %o %u')
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=("hib::/usr/bin/echo %u Download the HIB installer to \"$PWD\" or set up a hib:// DLAGENT. Read this PKGBUILD for more information.")

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/nuclearthrone/assets" "$pkgdir/opt/$pkgname/assets"
    install -Dm755 "$srcdir/nuclearthrone/runner" "$pkgdir/opt/$pkgname/runner"

    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}
    ln -s "/opt/$pkgname/assets/icon.png" \
          "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" \
                   "$pkgdir/usr/share/applications/$pkgname.desktop"
}
