# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>


pkgname=mathpix-snipping-tool
pkgver=02.04.0002
snap_ver=155 
pkgrel=1
pkgdesc="Mathpix Snipping Tool"
arch=('x86_64')
url="https://snapcraft.io/mathpix-snipping-tool"
license=('unknown')
makedepends=('squashfs-tools')
depends=('qt5-x11extras' 'qt5-webkit')
source=("https://api.snapcraft.io/api/v1/snaps/download/jnlZEYdmdXGhh6oJTtMsawNGZzEWmMhk_${snap_ver}.snap")
sha512sums=(
"15490f2a151abc89f08e14dbecf049ad45eedbd1b05d7616b66c69eadf1873c7e5857745518bafd7ad40b9a8472d53a201d571d2124907874c7c3651ba6dd788"
)


## run these to get the source URL and the version

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/mathpix-snipping-tool | jq '.download_url' -r

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/mathpix-snipping-tool | jq '.version' -r

prepare() {
  cd $srcdir
  unsquashfs -f "jnlZEYdmdXGhh6oJTtMsawNGZzEWmMhk_${snap_ver}.snap" /usr/bin/mathpix-snipping-tool \
                                                         /meta/gui/mathpix-snipping-tool.desktop \
                                                         /meta/gui/icon.svg
  sed 's|${SNAP}/meta/gui/icon.svg|mathpix-snipping-tool|g' -i squashfs-root/meta/gui/mathpix-snipping-tool.desktop
}

package() {
  cd $srcdir/squashfs-root
  install -Dm0644 meta/gui/mathpix-snipping-tool.desktop	$pkgdir/usr/share/applications/mathpix-snipping-tool.desktop
  install -Dm0644 meta/gui/icon.svg				$pkgdir/usr/share/icons/mathpix-snipping-tool.svg
  install -Dm0755 usr/bin/mathpix-snipping-tool			$pkgdir/usr/bin/mathpix-snipping-tool
}
