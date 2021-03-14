# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie (yochananmarqos) https://aur.archlinux.org/account/yochananmarqos
pkgname=webfontkitgenerator-git
pkgver=0.3.0.r36.gc8b41a1
pkgrel=1
pkgdesc="Create @font-face kits easily"
arch=('any')
url="https://github.com/rafaelmardojai/webfontkitgenerator"
provides=('webfontkitgenerator')
conflicts=('webfontkitgenerator')
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'gst-python' 'libhandy' 'python-fonttools' 'python-brotli')
makedepends=('meson' 'git')
source=("git+https://github.com/rafaelmardojai/webfontkitgenerator.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  # cutting off 'v' prefix in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}