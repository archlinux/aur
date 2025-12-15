# Maintainer: jgmdev <jgmdev@gmail.com>

_pkgname=wayfire-plugins
pkgname=wayfire-plugins-crt-effect-git
pkgver=r55.a6caa11
pkgrel=1
pkgdesc="Advanced CRT Monitor Emulation with Discrete, Retro, Royale, Perfect, and Cinema modes."
arch=('x86_64' 'aarch64')
url="https://github.com/killown/wayfire-plugins"
license=('MIT')
depends=('wayfire-git')
makedepends=('meson')
source=('git+https://github.com/killown/wayfire-plugins.git')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(git tag -l | grep ^v | tail -n 1 | sed 's/^v//g').$(git show -s --format=%ct)"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
  cd "${_pkgname}/plugins/crt-effect"
  meson setup --prefix=/usr --buildtype=release build
  meson compile -C build
}

package() {
  cd "${_pkgname}/plugins/crt-effect"
  DESTDIR="${pkgdir}" meson install -C build
}
