# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm-git
_pkgname=bterm
pkgver=v1.0.0.r13.95e17d6
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
conflicts=('bterm')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
makedepends=('git' 'npm' "libicns" "dpkg" "unp")
source=("bterm-git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname}"
  npm install
  npm run app:linux
}

package() {
	cd "$srcdir/${pkgname}"
  unp dist/bterm_1.0.0_amd64.deb
  unp data.tar.xz
  #appdir=/usr/lib/$_pkgname
  #install -d "$pkgdir/usr/bin/"
  #local _icon_dir="usr/share/icons/hicolor"
  #install -d "${pkgdir}"${appdir}
  #cp -r dist/bterm-linux-x64/* "${pkgdir}"${appdir}
  mv usr "${pkgdir}"
  #  local _icon_dir="usr/share/icons/hicolor"
  #for size in  32 512; do
  #      install -Dm644 \
  #          assets/icon_${size}x${size}.png \
  #          "${pkgdir}"/$_icon_dir/${size}x${size}/apps/${pkgname}.png
  #    done
#install -Dm644 assets/icon.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg
#ln -s /usr/lib/bterm/bterm $pkgdir/usr/bin/$_pkgname
}
