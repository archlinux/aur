# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
pkgname=bcunit-cunit-compat
pkgver=3.0.2
pkgrel=1
pkgdesc="Headers and libraries which allow building with BCUnit Cunit-based projects"
arch=('any')
url='https://github.com/BelledonneCommunications/bcunit'
license=('LGPL2')
depends=('bcunit')
conflicts=('cunit')
provides=("cunit=${pkgver}-${pkgrel}")
source=()
sha256sums=()

package() {
    # Provide BCUnit headers in /usr/include/CUnit
    mkdir -p "${pkgdir}/usr/include/CUnit"
    ln -s ../BCUnit/Automated.h "${pkgdir}/usr/include/CUnit/Automated.h"
    ln -s ../BCUnit/Basic.h "${pkgdir}/usr/include/CUnit/Basic.h"
    ln -s ../BCUnit/BCUnit.h "${pkgdir}/usr/include/CUnit/BCUnit.h"
    ln -s ../BCUnit/BCUnit_intl.h "${pkgdir}/usr/include/CUnit/BCUnit_intl.h"
    ln -s ../BCUnit/Console.h "${pkgdir}/usr/include/CUnit/Console.h"
    ln -s ../BCUnit/CUError.h "${pkgdir}/usr/include/CUnit/CUError.h"
    ln -s ../BCUnit/MyMem.h "${pkgdir}/usr/include/CUnit/MyMem.h"
    ln -s ../BCUnit/TestDB.h "${pkgdir}/usr/include/CUnit/TestDB.h"
    ln -s ../BCUnit/TestRun.h "${pkgdir}/usr/include/CUnit/TestRun.h"
    ln -s ../BCUnit/Util.h "${pkgdir}/usr/include/CUnit/Util.h"

    # Provide CUnit.h too
    ln -s ../BCUnit/BCUnit.h "${pkgdir}/usr/include/CUnit/CUnit.h"

    # Make linking with "-lcunit" use BCUnit library
    mkdir -p "${pkgdir}/usr/lib"
    ln -s libbcunit.so "${pkgdir}/usr/lib/libcunit.so"
    ln -s libbcunit.so.1 "${pkgdir}/usr/lib/libcunit.so.1"
    ln -s libbcunit.so.1.0.1 "${pkgdir}/usr/lib/libcunit.so.1.0.1"

    # Make pkg-config provide BCUnit files
    mkdir -p "${pkgdir}/usr/lib/pkgconfig"
    ln -s bcunit.pc "${pkgdir}/usr/lib/pkgconfig/cunit.pc"
}
