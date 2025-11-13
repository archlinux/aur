# Maintainer: shinka <shinnkka1@gmail.com>
pkgname=mpvpaper-stop-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r20.fce30be
pkgrel=1
pkgdesc="Pauses mpvpaper when windows are visible and resumes when workspace is empty on Hyprland"
arch=('x86_64')
url="https://github.com/pvtoari/mpvpaper-stop"
license=('MIT')
depends=('mpvpaper' 'hyprland' 'glibc' 'cjson')
makedepends=('git' 'meson' 'ninja') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=("python-pywal: set your colour scheme to the paused frame's one")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" meson install -C build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
