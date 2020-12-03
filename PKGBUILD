# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
pkgname=nspire-tools-git
provides=('nspire-tools-git')
pkgver=r2.6a7fccc
pkgrel=1
pkgdesc="The Swiss Army Knife for Ti-NSpire"
arch=('any')
url="https://github.com/ErnyTech/nspire-tools"
license=('MPL-2.0')
depends=('liblphobos' 'libnspire-git')
makedepends=('dub' 'ldc')
source=(
    "git+https://github.com/ErnyTech/nspire-tools.git"
)
sha1sums=(
    'SKIP'
)

pkgver()
{
    cd $srcdir/nspire-tools
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build ()
{
    cd $srcdir/nspire-tools
    dub build --force --compiler=ldc -b release
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/nspire-tools/nspire-tools $pkgdir/usr/bin/nspire-tools
    ln -sr $pkgdir/usr/bin/nspire-tools $pkgdir/usr/bin/nspire-filemanager
    ln -sr $pkgdir/usr/bin/nspire-tools $pkgdir/usr/bin/nspire-updater
    ln -sr $pkgdir/usr/bin/nspire-tools $pkgdir/usr/bin/nspire-info
} 
