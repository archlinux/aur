# Maintainer: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix
pkgver=7.0.0
pkgrel=1
pkgdesc="A software development kit for achieving high performance ray tracing on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64.sh"
source=("hib://$_script")
sha512sums=('349baf367af7890afac87a879c8f7360cc9c93e984cf234216062af0a3cedce8fc6f3fd74240897d4b3854622ce1976a78433cbeadf6fa89c8e84d24e26eef89')

DLAGENTS+=("hib::/usr/bin/echo %u - Please manually download $_script to $PWD from https://developer.nvidia.com/designworks/optix/download.")

PKGEXT='.pkg.tar'

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/$_script" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/$pkgname/OptiX_EndUserLicense.pdf"
}
