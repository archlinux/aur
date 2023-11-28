# Maintainer: Hayate Nakamura <hayatehay.njb at gmail dot com>
pkgname=unifetch-git
_pkgname=unifetch
epoch=1
pkgver=r5419.4587679e
pkgrel=1
pkgdesc="An unofficial inheritor of neofetch, fresh version."
arch=('any')
url="https://github.com/njb-fm/unifetch"
license=('MIT')
depends=('bash')
optdepends=(
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'catimg: Display Images'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
makedepends=('git')
checkdepends=('shellcheck')
conflicts=("unifetch" "neofetch")
provides=("unifetch" "neofetch")
source=(${_pkgname}::"git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
