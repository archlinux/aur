# Maintainer:  Ainola

pkgname=nuclear-throne-hib
pkgver=20160815
pkgrel=3
pkgdesc="Action roguelike-like about mutants trying to fight for the throne in a post-apocalyptic world."
arch=('x86_64')
url="http://nuclearthrone.com"
license=('custom')
makedepends=('unzip')
depends=('lib32-openssl-1.0' 'lib32-openal' 'lib32-glu'
         'lib32-openssl' 'lib32-libxxf86vm' 'lib32-libxrandr')
source=("hib://nuclearthrone-linux.zip"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('7834649060d8c0d50e976555617d49ae7c0787d1570c1768395ad4c04bd9f77b'
            '673fc3ff551fac28fced5386e9642019cc5dde1dbd44af0a8407a38eb4cdd9a2'
            'a4eb9dd92ae6db76aef291969812dc367395bfcbc3599b31b3e0d32f8c600945')

# Prevent compressing final package, otherwise compression time takes an
# eternity for not much gain
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
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r nuclearthrone/assets "$pkgdir/opt/$pkgname/assets"
    install -Dm755 nuclearthrone/runner -t "$pkgdir/opt/$pkgname/"

    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"

    mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}
    install -Dm644 "nuclearthrone/assets/icon.png" \
        -t "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
}
