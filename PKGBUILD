# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_repo=aerial-sddm-theme
_pkgname=sddm-theme-aerial
pkgname=$_pkgname-git
pkgver=0.1.r24.g90d9941
pkgrel=1
pkgdesc="SDDM theme with Apple TV Aerial videos"
arch=('any')
url="https://github.com/3ximus/aerial-sddm-theme"
license=('GPL')
depends=('sddm' 'gst-libav' 'gst-plugins-good' 'phonon-qt5-gstreamer')
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
  sh generate_playlist.sh  
  if [ -d screens ]; then
       rm -rf screens
  fi
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/sddm/themes/aerial/" ${srcdir}/$_repo/*
}
