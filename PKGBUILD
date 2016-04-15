# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=xt7-player-mpv
pkgver=0.17.384
#hotfix=-hotfix
pkgrel=1
_realname=xt7-player-mpv
pkgdesc="Aims to be an 'almost complete' but usable mpv gui"
arch=('any')
url="http://xt7-player.sourceforge.net/xt7forum/"
license=('custom')

depends=('gambas3-gb-image>=3.6.2' 
    'gambas3-runtime>=3.6.2'
    'gambas3-gb-form>=3.6.2'
	'gambas3-gb-qt4>=3.6.2'
	'gambas3-gb-form>=3.6.2'
	'gambas3-gb-dbus>=3.6.2' 
	'gambas3-gb-desktop>=3.6.2' 
	'gambas3-gb-settings>=3.6.2' 
	'gambas3-gb-form-mdi>=3.6.2' 
	'gambas3-gb-form-dialog>=3.6.2' 
	'gambas3-gb-net>=3.6.2' 
	'gambas3-gb-net-curl>=3.6.2' 
	'gambas3-gb-qt4-ext>=3.6.2' 
	'gambas3-gb-web>=3.6.2' 
	'gambas3-gb-libxml>=3.6.2' 
	'gambas3-gb-form-stock>=3.6.2' 
	'gambas3-gb-image>=3.6.2'
	'gambas3-gb-compress>=3.6.2'
	'gambas3-gb-signal>=3.6.2'
	'gambas3-gb-desktop-x11>=3.6.2'
	'gambas3-gb-args>=3.6.2'
	'mpv>=1:0.10.0'
	'taglib'
	'youtube-dl>=2015.08.28'
	'wget')

makedepends=('gambas3-devel')
optdepends=('python2: for Opensubtitles.org integration' 'ladspa: more audio plugins' 'linuxtv-dvb-apps: for DVB support' 'dvbsnoop: DVBT EPG' 'xdg-utils: for desktop integration' 'xbindkeys: for global hotkeys support' 'aria2: for youtube segmented downloads')

source=(https://github.com/kokoko3k/xt7-player-mpv/archive/$pkgver$hotfix.tar.gz 'license.txt')



build() {
  cd ${srcdir}/${_realname}-${pkgver}$hotfix
  gbc3 -e -a -g -t -p -m
  gba3 || return 1

}

package() {

  cd ${srcdir}/${_realname}-${pkgver}$hotfix/

  sed -i 's/Exec=xt7-player-mpv.gambas/Exec=xt7-player-mpv/' ./xt7-player-mpv.desktop

  install -d ${pkgdir}/usr/bin
  install -m755 ${_realname}-${pkgver}$hotfix.gambas ${pkgdir}/usr/bin/xt7-player-mpv
  install -D xt7-player-mpv.png ${pkgdir}/usr/share/pixmaps/xt7-player-mpv.png
  install -D xt7-player-mpv.desktop ${pkgdir}/usr/share/applications/xt7-player-mpv.desktop
  install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/xt7-player/license.txt

}

md5sums=('1d9306389d3ab1a18c06f84bae66de61'
         'b6f1380e33b47d0ed95c7ba1b3f4ec73')
