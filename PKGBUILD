# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=vlc-tunein-radio
pkgver=20150125
pkgrel=1
pkgdesc="TuneIn Radio LUA Script for VLC 2.x"
url="https://github.com/diegofn/TuneIn-Radio-VLC"
license=('custom')
arch=('any')
depends=('vlc' 'git')
_gitroot="git://github.com/diegofn/TuneIn-Radio-VLC.git"
_gitname="TuneIn-Radio-VLC"

package() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  
  cd ${srcdir}/${_gitname}

  install -D -m 644 "tunein.lua" "${pkgdir}/usr/lib/vlc/lua/sd/tunein.lua"
  install -D -m 644 "playlist/radiotime.lua" "${pkgdir}/usr/lib/vlc/lua/playlist/radiotime.lua"
  install -D -m 644 "playlist/streamtheworld.lua" "${pkgdir}/usr/lib/vlc/lua/playlist/streamtheworld.lua"

  msg ''
  msg 'tunein.com account credentials can be supplied'
  msg '  globally in /usr/lib/vlc/lua/sd/tunein.lua'
  msg '  locally in ~/.local/share/vlc/lua/sd/tunein.lua'
  msg ''
  msg 'by setting variables'
  msg '  local __username__ = "user"'
  msg '  local __password__ = "password"'
  msg ''
}
