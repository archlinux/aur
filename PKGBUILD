# Maintainer : Antonio Orefice <xt7player@gmail.com>
pkgname=xt7-player-mpv
pkgver=0.37.3190
#hotfix=-hotfix
pkgrel=2
_realname=xt7-player-mpv
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
    'mpv>=0.29'
    'taglib'
    'yt-dlp'
    'wget'
)

makedepends=('gambas3-dev-tools')
optdepends=('python2: for Opensubtitles.org integration' 'ladspa: more audio plugins' 'linuxtv-dvb-apps: for DVB support' 'dvbsnoop: DVBT EPG' 'xdg-utils: for desktop integration' 'xbindkeys: for global hotkeys support' 'aria2: for youtube segmented downloads')

source=(https://github.com/kokoko3k/xt7-player-mpv/archive/$pkgver$hotfix.tar.gz 'license.txt')


build() {
  cd ${srcdir}/${_realname}-${pkgver}$hotfix
  gbc3 -e -a -g -t  -f public-module -f public-control || gbc3 -e -a -g -t -p -m  
  gba3 || return 1

}

package() {

  cd ${srcdir}/${_realname}-${pkgver}$hotfix/
 
  sed -i 's/xt7-player-mpv.gambas/xt7-player-mpv/' ./xt7-player-mpv.desktop

  install -d ${pkgdir}/usr/bin
  install -m755 ${_realname}-${pkgver}$hotfix.gambas ${pkgdir}/usr/bin/xt7-player-mpv
  install -D xt7-player-mpv.png ${pkgdir}/usr/share/pixmaps/xt7-player-mpv.png
  install -D xt7-player-mpv.desktop ${pkgdir}/usr/share/applications/xt7-player-mpv.desktop
  install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/xt7-player/license.txt

}

md5sums=('1e1b71cbd0ce82213ec87572229f5ffc'
         'b6f1380e33b47d0ed95c7ba1b3f4ec73')
