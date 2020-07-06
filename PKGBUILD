# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>

# https://aur.archlinux.org/packages/steamtinkerlaunch
pkgname=steamtinkerlaunch
pkgver=0.921
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
_commit='25587777ce92159260595dfe5fef0080bf9c8569'
source=("git+https://github.com/frostworx/steamtinkerlaunch.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf $(grep 'PROGVERS=' stl | head -n1 | cut -d\" -f2 | sed 's/^v//')
}

package() {
  cd "$pkgname"
  install -Dm755 stl -t "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r *.md sbs tweaks "$pkgdir/usr/share/doc/${pkgname%-git}"
}
