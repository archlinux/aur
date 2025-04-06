# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix
pkgver=9.0.0
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU."
arch=(x86_64)
url="https://developer.nvidia.com/optix"
license=(LicenseRef-NvidiaProprietary)
depends=(cuda)
options=(!strip)
_script="NVIDIA-OptiX-SDK-${pkgver}-linux64-x86_64.sh"
source=("cmake.patch")
source_x86_64=("file://${_script}")
sha512sums=('c2b3f122bf4e5d1bd987c3ce9693b24d2acd55f71f7366e49ebc0ba2f800945e6ddde439428761c6c12ec77f34a9334fb6900af2c1b10c40dd2905bb58c9ded2')
sha512sums_x86_64=('7c59303f17ca7ed8573e454c2d3a4823a5212e1d895ce4bafb5ced6f94a2cac36d83ca336f38c511d72ec0eede4c34c89bd5b545be9f5039fded722de221f62b')

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

