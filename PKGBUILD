# Maintainer: Robin H. <robin at blckct dot io>

pkgname=sonixd-bin
pkgver=0.15.5
pkgrel=2
pkgdesc="The latest stable binary release of Sonixd - a full-featured Subsonic API compatible cross-platform desktop client"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=('GPL3')
depends=('electron22' 'fuse')
makedepends=('asar')
conflicts=('sonixd' 'sonixd-appimage')
replaces=('sonixd' 'sonixd-appimage')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_filename=Sonixd-$pkgver-linux-x64
source=("${url}/releases/download/v${pkgver}/${_filename}.tar.xz"
        "sonixd.desktop"
        "sonixd.sh"
)
sha256sums=('0eb17e5e84369ece254aa29a95642ae05218c1168b2fc2d51e9a707300e40bb7'
            '9e2e1cce47b594b75b8df7a1cf3a5a6da340dda9d0cfdf2aa305d097fc0bbc7a'
            '6394706bb532ad4e01bd3f824e570c3361e1f03503b6bf4afb5b811c9d813e5e'
)


package() {
  cd "$srcdir"
  install -Dm755 "sonixd.sh" "$pkgdir/usr/bin/sonixd"

  install -Dm644 "sonixd.desktop" -t "$pkgdir/usr/share/applications/"

  cd "$_filename/resources/"

  install -Dm644 "assets/icons/512x512.png" "$pkgdir/usr/share/pixmaps/sonixd.png"

  install -dm0755 "$pkgdir/usr/lib/sonixd"
  find . -type d -exec install -d {,"$pkgdir"/usr/lib/sonixd/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/lib/sonixd/}{} \;

}

