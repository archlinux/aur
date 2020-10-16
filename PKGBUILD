# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>
pkgname=mathpix-snipping-tool
pkgver=02.07.0002
_snapver=195
pkgrel=1
pkgdesc="Mathpix Snipping Tool"
arch=('x86_64')
url="https://snapcraft.io/mathpix-snipping-tool"
license=('unknown')
depends=('qt5-x11extras' 'qt5-webkit')
makedepends=('squashfs-tools')
source=("https://api.snapcraft.io/api/v1/snaps/download/jnlZEYdmdXGhh6oJTtMsawNGZzEWmMhk_${_snapver}.snap")
sha512sums=('6680dae3b0be0f90934142b50229401b75a1b6c2d036fa1f86a51812dc4b9a9d0747e934ea7718df24f03ecf6bc2a1260310f27af926af929b9f842c9381e24c')


## run these to get the source URL and the version, require jq

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/mathpix-snipping-tool | jq '.download_url' -r

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/mathpix-snipping-tool | jq '.version' -r

prepare() {
  cd $srcdir
  unsquashfs -f "jnlZEYdmdXGhh6oJTtMsawNGZzEWmMhk_${_snapver}.snap" /usr/bin/mathpix-snipping-tool \
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
