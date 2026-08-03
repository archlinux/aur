# Maintainer: Bink

pkgname=qpress-git
_gitname="qpress"
pkgver=20260802.r65.a147e28
pkgrel=1
pkgdesc='Portable high-speed file archiver using QuickLZ'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/PierreLvx/qpress"
# Upstream: GPL 1, 2 and 3 (LICENSE.GPL-* / readme.md)
license=('GPL-1.0-only' 'GPL-2.0-only' 'GPL-3.0-only')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	printf "%s.r%s.%s" "$(git -C $_gitname tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git -C $_gitname rev-list --count HEAD)" "$(git -C $_gitname rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}" || exit
  make
}

package() {
  cd "${srcdir}/${_gitname}" || exit
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSE.GPL-1.0 LICENSE.GPL-2.0 LICENSE.GPL-3.0 \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
