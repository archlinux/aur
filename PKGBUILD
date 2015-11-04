# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=slim-theme-mesos-git
pkgver=1.0
pkgrel=1
pkgdesc="Apache Mesos SLiM theme."
arch=('any')
url="https://github.com/en0/SLiM-theme-mesos"
license=('unkonwn')
optdepends=('slim: login manager providing theme support')
makedepends=('git')
install=
conflicts=('slim-theme-mesos')
provides=('slim-theme-mesos')
source=('git://github.com/en0/SLiM-theme-mesos')
md5sums=('SKIP')

_gitroot=$url
_gitname=SLiM-theme-mesos

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname"
  install -m 644 -D background.png "${pkgdir}"/usr/share/slim/themes/mesos/background.png
  install -m 644 -D panel.png "${pkgdir}"/usr/share/slim/themes/mesos/panel.png
  install -m 644 -D slim.theme "${pkgdir}"/usr/share/slim/themes/mesos/slim.theme
  install -m 644 -D preview.png "${pkgdir}"/usr/share/slim/themes/mesos/preview.png
}

# vim:set ts=2 sw=2 et:
