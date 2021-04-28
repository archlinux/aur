# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dmscripts-git
_pkgname=dmscripts
pkgver=1.0.r165.994d7a4
pkgrel=1
pkgdesc="A collection of dmenu scripts"
arch=('any')
url="https://gitlab.com/dwt1/dmscripts.git"
license=('GPL3')
depends=(dmenu findutils xclip xdotool xorg-xrandr zenity )
groups=()
makedepends=()
checkdepends=()
optdepends=(
  'emacs: editor for dmconf '
  'libnotify: used by dmlogout'
  'maim: used by dmscrot'
  'mpc: used by dm-music'
  'mpd: used by dm-music'
  'qutebrowser: used by dmqute'
  'reddio: used by dmred'
  'slock: used by dmlogout'
  'sxiv: used by dmwall'
  'xwallpaper: used by dmwall'
  'udisks2: used by dm-usbmount'
  )
provides=(dmscripts)
conflicts=(dmscripts)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd ${_pkgname}
  # Make sure to install all scripts
  for script in $(echo scripts/*); do 
    install -Dm755 ${script} -t "${pkgdir}/usr/bin"
  done
  install -Dm644 man/dmscripts.7 "${pkgdir}/usr/local/man/man1/dmscripts.7"  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

