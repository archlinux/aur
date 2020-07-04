# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>

pkgname=steamtinkerlaunch-git
pkgver=0.91.r32.c1f6d09
pkgrel=1
pkgdesc="Wrapper script for Steam custom launch options"
arch=('any')
url="https://github.com/frostworx/steamtinkerlaunch"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=(
  'strace'
  'zenity'
  'gamemode'
  'mangohud'
  'vkbasalt'
  'winetricks'
  'wget: for optional reshade download'
  'unzip: for optional reshade download'
  'git: for pulling optional shaders'
  'xdotool: for playing regular games side-by-side in VR'
  'xorg-xwininfo: for playing regular games side-by-side in VR'
  'vr-video-player: for playing regular games side-by-side in VR'
  'xdg-utils: for opening the ProtonDB URL of started game'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/frostworx/steamtinkerlaunch.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" \
		"$(grep 'PROGVERS=' stl | head -n1 | cut -d\" -f2 | sed 's/^v//')" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 stl -t "$pkgdir/usr/bin"

	install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
	cp -r *.md sbs tweaks "$pkgdir/usr/share/doc/${pkgname%-git}"
}