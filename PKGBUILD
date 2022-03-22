# Maintainer: Alex Wicks <alex@awicks.io>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

_repo=aerial-sddm-theme
_pkgname=sddm-theme-aerial
pkgname=$_pkgname-git
pkgver=0.1.r59.g06beb74
pkgrel=2
pkgdesc="SDDM theme with Apple TV Aerial videos"
arch=('any')
url="https://github.com/3ximus/aerial-sddm-theme"
license=('GPL')
depends=('sddm' 'gst-libav' 'phonon-qt5-gstreamer' 'gst-plugins-good' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-multimedia')
makedepends=('git')
install="$_pkgname.install"
backup=('usr/share/sddm/themes/aerial/theme.conf.user')
source=("git+https://github.com/3ximus/$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_repo

  local _ver=$(awk -F '=' '/Version/ {print $2}' metadata.desktop)
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd ${srcdir}/$_repo
  if [ -d screens ]; then
       rm -rf screens
       rm README.md
  fi
}
package() {
  mkdir -p "$pkgdir/usr/share/sddm/themes/aerial/" 
  mv ${srcdir}/$_repo/* "$pkgdir/usr/share/sddm/themes/aerial/" 
  chmod 755 "$pkgdir/usr/share/sddm/themes/aerial/"
}
