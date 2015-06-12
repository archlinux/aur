# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>
pkgname=fadecut-git
_gitname=fadecut
pkgver=20140917
pkgrel=1
pkgdesc="Toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles (git version)"
arch=("i686" "x86_64")
url="http://github.com/micressor/fadecut"
license=('GPL3')
depends=("id3v2" "sox" "streamripper" "vorbis-tools" "git")
optdepends=("lame")
provides=("fadecut")
conflicts=("fadecut")
source=('git+https://github.com/micressor/fadecut.git')
sha256sums=('SKIP')

package() {

  msg "Connecting to GIT server...."
  
  if [[ -d $_gitname ]]; then
    cd $_gitname || return 1
    git pull || return 1
  else
    git clone $_gitroot || return 1
  fi
  msg " checkout done."
  
  cd $srcdir/$_gitname || return 1
    
  install -Dm755 fadecut "${pkgdir}/usr/bin/fadecut"
  install -Dm755 fcstats "${pkgdir}/usr/bin/fcstats"
  install -D fadecut.1 "${pkgdir}/usr/share/man/man1/fadecut.1"
 }

# vim:set ts=2 sw=2 et:
