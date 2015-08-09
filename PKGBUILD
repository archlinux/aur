# Maintainer: Milan Oberkirch <aur@oberkirch.org>
pkgname=zenbu-login
pkgver=0.01
pkgrel=0
pkgdesc="Automates login to zenbu.net.nz wifi networks."
arch=('any')
url="http://oberkirch.org"
license=('GPL3')
depends=('curl' 'bash' 'grep')
backup=('etc/zenbu-login')
makedepends=('git')
md5sums=()

_gitroot="git@github.com:zvyn/zenbu-login.git"
_gitname=zenbu-login

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
}

package() {
  mkdir -p "${pkgdir}/etc" "${pkgdir}/usr/bin"
  cp "$srcdir/$_gitname/zenbu-login.bash" "${pkgdir}/usr/bin/zenbu-login"
  chmod +x "${pkgdir}/usr/bin/zenbu-login"
  cat <<EndOfFile > "${pkgdir}/etc/zenbu-login"
username=
password=
EndOfFile
}

# vim:set ts=2 sw=2 et:
