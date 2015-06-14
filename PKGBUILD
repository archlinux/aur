# Maintainer: Dicebot <public@dicebot.lv>
pkgname=dlang-digger
pkgver=2.3
pkgrel=1
pkgdesc="A tool to build D and bisect old D versions"
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/CyberShadow/Digger"
license=('custom')
depends=('git')
makedepends=('git' 'dmd' 'libphobos-devel' 'dtools')
source=(
    "git+https://github.com/CyberShadow/Digger.git#tag=${pkgver//_/-}"
    'digger.ini'
)
sha256sums=(
    'SKIP'
    '8077a00ca2c6b41ec2a8175a2fb7114787d076627d49f9374ddbbd2394ed9e8f'
)
backup=(
    'etc/digger.ini'
)

build ()
{
    cd $srcdir/Digger
    git submodule update --init
    rdmd -g --compiler=dmd --build-only digger.d
}

package ()
{
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/doc/digger $pkgdir/usr/share/licenses/digger $pkgdir/etc

    install -m755 $srcdir/Digger/digger $pkgdir/usr/bin/digger
    install -m644 $srcdir/digger.ini $pkgdir/etc/digger.ini
    install -m644 $srcdir/Digger/bisect.ini.sample  $pkgdir/usr/share/doc/digger/bisect.ini.sample
    install -m644 $srcdir/Digger/LICENSE.md $pkgdir/usr/share/licenses/digger/LICENSE
}
