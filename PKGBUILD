# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix6
pkgver=6.5.0
pkgrel=1
pkgdesc="A software development kit for achieving high performance ray tracing on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64.sh"
source=("file://$_script")
sha512sums=('fe912e456a77cce9710f96fe353200e49e97addb5892829acced6a74869693a00857da776b56df530a4ea98ab6c856808aa95ded634b2a5d47ff9c18c8b483af')

if ! [ -f $_script ]; then
    msg2 "Please manually download $_script to $PWD from https://developer.nvidia.com/designworks/optix/download."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/$_script" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/$pkgname/OptiX_EndUserLicense.pdf"
}
