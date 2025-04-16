#!/bin/hint/bash
# Maintainer  : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix8
pkgver=8.1.0
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU."
arch=(x86_64)
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
provides=("${pkgname%8}=${pkgver%.0}")
conflicts=('optix')
options=(!strip)
_script="NVIDIA-OptiX-SDK-8.1.0-linux64-x86_64-35015278.sh"
source=("cmake.patch")
source_x86_64=("local://${_script}")
sha512sums=('c2b3f122bf4e5d1bd987c3ce9693b24d2acd55f71f7366e49ebc0ba2f800945e6ddde439428761c6c12ec77f34a9334fb6900af2c1b10c40dd2905bb58c9ded2')
sha512sums_x86_64=('fc7df50316fb09871837fd6e7eda8d783921e6759be76eab23d15f99ec3072f5c3333a8d449985281ba1ed5c75d2051e93f4808260f3be69a5065fca0cdcc06d')

if ! [ -f ${_script} ]; then
    echo "Please manually download ${_script} to $PWD from https://developer.nvidia.com/designworks/optix/download."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/${_script}" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    patch "$pkgdir/opt/optix/SDK/CMake/FindOptiX.cmake" "$srcdir/cmake.patch"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/${pkgname}/OptiX_EndUserLicense.pdf"
}

