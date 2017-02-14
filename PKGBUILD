# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=xt7-player-mpv-git
pkgver=20171402
pkgrel=1
pkgdesc="Aims to be an 'almost complete' but usable mpv gui"
arch=('any')
url="http://xt7-player.sourceforge.net/xt7forum/"
license=('custom')

depends=(
    'gambas3-gb-args'
    'gambas3-gb-compress'
    'gambas3-gb-dbus'
    'gambas3-gb-desktop'
    'gambas3-gb-desktop-x11'
    'gambas3-gb-form'
    'gambas3-gb-form-dialog'
    'gambas3-gb-form-mdi'
    'gambas3-gb-form-stock'
    'gambas3-gb-image'
    'gambas3-gb-libxml'
    'gambas3-gb-net'
    'gambas3-gb-net-curl'
    'gambas3-gb-qt5'
    'gambas3-gb-settings'
    'gambas3-gb-signal'
    'gambas3-gb-util-web'
    'gambas3-gb-web'
    
    'mpv'
    'taglib'
    'youtube-dl'
    'wget'
)

makedepends=('gambas3-devel' 'git')
optdepends=('python2: for Opensubtitles.org integration' 'ladspa: more audio plugins' 'linuxtv-dvb-apps: for DVB support' 'dvbsnoop: DVBT EPG' 'xdg-utils: for desktop integration' 'xbindkeys: for global hotkeys support' 'aria2: for youtube segmented downloads')

_gitroot="https://github.com/kokoko3k/xt7-player-mpv.git"

build() {
  cd $srcdir
  rm -R $srcdir/xt7-player-mpv &>/dev/null || echo "No old repository found, proceding to git clone..."
  git clone --depth 1 $_gitroot || return 1

  cd $srcdir/xt7-player-mpv

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd xt7-player-mpv

  mv xt7-player-mpv.gambas xt7-player-mpv-git.gambas
  mv xt7-player-mpv.desktop xt7-player-mpv-git.desktop
  mv xt7-player-mpv.png xt7-player-mpv-git.png

  sed -i 's/Name=xt7-player-mpv/Name=xt7-player-mpv-git/' ./xt7-player-mpv-git.desktop
  sed -i 's/Icon=xt7-player-mpv/Icon=xt7-player-mpv-git/' ./xt7-player-mpv-git.desktop
  sed -i 's/Exec=xt7-player-mpv.gambas/Exec=xt7-player-mpv-git/' ./xt7-player-mpv-git.desktop
#  sed -i 's/xt7-player.png/xt7-player-git.png/' ./xt7-player-git.desktop

  install -d ${pkgdir}/usr/bin
  install -m755 xt7-player-mpv-git.gambas ${pkgdir}/usr/bin/xt7-player-mpv-git
  install -D xt7-player-mpv-git.png ${pkgdir}/usr/share/pixmaps/xt7-player-mpv-git.png
  install -D xt7-player-mpv-git.desktop ${pkgdir}/usr/share/applications/xt7-player-mpv-git.desktop
}

