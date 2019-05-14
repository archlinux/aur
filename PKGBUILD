# Maintainer: Yuan Zhou <xyyqzy@hotmail.com>
pkgname=optix
_basever=6.0.0
_subver=25650775
pkgver=$_basever.$_subver
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU"
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
options=(!strip)
install=optix.install
_script="NVIDIA-OptiX-SDK-$_basever-linux64-$_subver.sh"
source=("hib://$_script"
        "optix.conf")
sha512sums=('33fbb312c47174a9ddb26bd4b1a1e5089b70eaebdecd80561c91c1926fba2fb8c94ec39b4c2dc8f0ccbb5e27bbd38ad8fb08df1d605ed1ec5b3fd34ecca908b7'
            'eb98e0dbc3b0539a1118ffa9affcf34f0f8cb6fbcd4f621dade8f2e1975cbff60885828dc85c262621e1e22b098b6134894af416db859de6de41daabcdb01204')

DLAGENTS+=("hib::/usr/bin/echo %u - Please manually download $_script to $PWD from https://developer.nvidia.com/designworks/optix/download.")

PKGEXT='.pkg.tar'

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/$_script" --prefix="$pkgdir/opt/optix" --exclude-subdir
    install -Dm644 "$srcdir/optix.conf" "$pkgdir/etc/ld.so.conf.d/optix.conf"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/$pkgname/OptiX_EndUserLicense.pdf"
}
