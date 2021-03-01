# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
# Co-Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=steamtinkerlaunch-git
pkgver=4.0_next7.r194.145caa2
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
		"$(grep 'PROGVERS=' stl | head -n1 | cut -d\" -f2 | sed 's/^v//' | sed 's/-/_/g')" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 stl -t "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/stl"
  cp -r categories lang misc regs reshadepresets tweaks "$pkgdir/usr/share/stl"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}