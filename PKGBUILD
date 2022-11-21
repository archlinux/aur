# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gpr-unit-provider
pkgver=23.0.0
pkgrel=2

pkgdesc='A unit provider for Libadalang based on GPR project analysis library.'
url='https://github.com/AdaCore/gpr-unit-provider'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=(gpr libadalang)
makedepends=('gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("08c8194812042134730b4bb4cb5ac8761cb7798f57dfbee2dbf41913b5f8b382")


build()
{
    cd "$srcdir/$pkgname-$pkgver"

    make ENABLE_SHARED=no                \
         GPR_UNIT_PROVIDER_BUILD=release \
         PROCESSORS=0
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    make ENABLE_SHARED=no                \
         GPR_UNIT_PROVIDER_BUILD=release \
         PROCESSORS=0                    \
         prefix="$pkgdir/usr"            \
         install

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
