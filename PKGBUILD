# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gpr
pkgver=23.0.0
pkgrel=3

pkgdesc='Parser for Ada GPR project files.'
url='https://github.com/AdaCore/gpr'
arch=('i686' 'x86_64')
license=('GPL3' 'Apache')

depends=(python libadalang which python-funcy python-mako python-docutils)
makedepends=('gprbuild' 'python-e3-core')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("c7c0ac859547a53dc0bb60c4370e3063ac612a2d229d656b1465715b099afb11")


prepare()
{
    cd "$srcdir/$pkgname-$pkgver"
    make setup prefix="$pkgdir/usr" GPR2KBDIR=/usr/share/gprconfig
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    make install
   
    # These conflict with the binaries from 'gprbuild'.
    #
    rm "$pkgdir/usr/bin/gprclean"
    rm "$pkgdir/usr/bin/gprconfig"
    rm "$pkgdir/usr/bin/gprinstall"
    rm "$pkgdir/usr/bin/gprls"
    rm "$pkgdir/usr/bin/gprname"

    # Install the license.
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644 \
       "LICENSE"     \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
