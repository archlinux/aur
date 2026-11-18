# Maintainer: Tsaitang  <Tsaitang404 at gmail dot com>
pkgname="trilium-next-server-bin"
pkgver=0.107.0
pkgrel=2
pkgdesc="Trilium Notes Server Next version"
arch=('x86_64')
url="https://github.com/TriliumNext/Trilium"
license=('AGPL3')
depends=('libxss' 'nss')
conflicts=('trilium-server-bin'
	   'trilium-server-cn'
   	   'trilium-server-cn-bin')
source=("$pkgname-$pkgver.tar.xz::https://github.com/TriliumNext/Trilium/releases/download/v$pkgver/TriliumNotes-Server-v$pkgver-linux-x64.tar.xz" "trilium-next-server.sh" "trilium-next-server.service")
sha256sums=('a217b5ac702e4bd9d401cfd5c6e9ee25f0a6f4a0c67345c65bd67dc8663d3dce'
    '9f21966fea2c209ed575090879eede7388f783c0bf7417dfe70021d4c58b48f7'
    'f002d981d84b5314755dc059cdef341ed3a492506fb3d7bf789342383c87c358')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-next-server"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    cp -a "$srcdir/TriliumNotes-Server-$pkgver-linux-x64/." "$pkgdir/opt/trilium-next-server"
    # Create command and make it executable
    install -vDm755 "$srcdir/trilium-next-server.sh" "${pkgdir}/usr/bin/trilium-next-server"
    install -vDm644 "$srcdir/trilium-next-server.service" -t "${pkgdir}/usr/lib/systemd/system"
}
