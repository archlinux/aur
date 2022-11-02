# Maintainer: Robin H. <robin at blckct dot io>

pkgname=sonixd-bin
pkgver=0.15.3
pkgrel=1
pkgdesc="The latest stable binary release of Sonixd - a full-featured Subsonic API compatible cross-platform desktop client"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=('GPL3')
depends=('electron13' 'fuse')
makedepends=('asar')
conflicts=('sonixd' 'sonixd-appimage')
replaces=('sonixd' 'sonixd-appimage')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_filename=Sonixd-$pkgver-linux-x64
source=("${url}/releases/download/v${pkgver}/${_filename}.tar.xz"
        "sonixd.desktop"
        "sonixd.sh"
)
sha256sums=('28c259ce8c0c9938c3c0e3812883b0f364f3b4ee92addc74528938f98610a1a6'
            '9e2e1cce47b594b75b8df7a1cf3a5a6da340dda9d0cfdf2aa305d097fc0bbc7a'
            'dfba24b8e1b23613aabab5bdc477247f7f7772c60858030ba83e16ddf7a726cf'
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

