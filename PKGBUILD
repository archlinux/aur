# Maintainer: Dicebot <public@dicebot.lv>
# Maintainer: tee < teeaur at duck dot com >
pkgname=dstep-git
provides=('dstep')
pkgver=r608.2cb53c1
pkgrel=1
pkgdesc="Automatic C header to D module translator"
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/jacob-carlborg/dstep"
license=('custom')
makedepends=('dub' 'dmd')
source=(
    "git+$url"
    "http://www.boost.org/LICENSE_1_0.txt"
)
sha1sums=('SKIP'
          '3cba29011be2b9d59f6204d6fa0a386b1b2dbd90')

pkgver()
{
    cd $srcdir/dstep
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build ()
{
    cd $srcdir/dstep
    dub build -b release
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/dstep/bin/dstep $pkgdir/usr/bin/dstep
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m644 $srcdir/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
