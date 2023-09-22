# Maintainer: Christoph Petrausch aur@petrausch.info
pkgname=gnome-shell-extension-paperwm-git
_pkgname=PaperWM
pkgver=v44.10.3.r0.g4b1c110
pkgrel=1
pkgdesc="A gnome shell extension providing scrollable tiling of windows and per monitor workspaces."
arch=('any')
url="https://github.com/paperwm/PaperWM"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/paperwm/PaperWM#branch=release")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  for i in $(find -type f -not -path '*.git*')
    do
        install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/paperwm@paperwm.github.com/$i
    done
}
