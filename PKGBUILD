# Author: Árni Dagur <arni@dagur.eu>

# This PKGBUILD is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname='intel-daal'
_year='2019'
_v_a='1'
_v_b='004'
_tag_suffix='_u1.1'
pkgver="$_year.$_v_a.$_v_b"
pkgrel=1
pkgdesc='Intel Data Acceleration Library for C++ (Intel® DAAL)'
arch=('x86_64' 'i686')
url='https://software.intel.com/en-us/intel-daal'
license=('Apache-2.0')
depends=('intel-tbb' 'gcc-libs')

source=("https://github.com/intel/daal/releases/download/$_year$_tag_suffix/l_daal_oss_p_$pkgver.tgz")
sha512sums=('57c8ff215f597c52deb0b5335d80f489edb53543f2340ba494eede1993208352551de02c560383aca8eb5cd5835735e895a466448fe061e9949cf993d6587192')

# Intel uses their own fancy architecture names; see:
# https://software.intel.com/en-us/articles/intel-architecture-platform-terminology
if [ "CARCH" = "i686" ]; then
    _i_arch='ia32'
else
    _i_arch='intel64'
fi

package() {
    cd $srcdir/l_daal_oss_p_$pkgver/daal_prebuild/linux/daal

    # This package does not include Java bindings; if anyone wants to make
    # a split package, feel free to submit a patch.
    rm lib/"$_i_arch"_lin/libJavaAPI.so

    install -d "$pkgdir"/usr/lib
    install -m755 lib/"$_i_arch"_lin/*.so* "$pkgdir"/usr/lib

    install -d "$pkgdir"/usr/include
    cp -a include "$pkgdir"/usr/include/daal
}

# vim: sts=4:sw=4:et
