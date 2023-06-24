# Maintainer: CyrIng <labs[at]cyring[dot]fr>
# Contributor: CyrIng <labs[at]cyring[dot]fr>
pkgname=xdm-hallo
pkgver=0.19
pkgrel=1
pkgdesc="HALLO for XDM display manager"
arch=(any)
license=('GPL')
url="http://github.com/cyring/xdm-hallo"
depends=('xorg-xdm' 'xorg-xmessage' 'xterm' 'gawk')
optdepends=('psmisc' 'numlockx' 'xorg-xsetroot' 'xorg-xclock' 'xorg-xdpyinfo' 'xorg-xwininfo' 'imagemagick' 'scrot')
backup=(etc/xdm-hallo/xdm-hallo.rc)
install=xdm-hallo.install
source=(xdm-config
	Xsetup
	Xstartup
	Xsession
	Xreset
	xdm-hallo.rc
	xdm-hallo-xdesktops
	xdm-hallo.service
	chocolate.rc
	navy.rc)
md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP')

package() {
  mkdir -p ${pkgdir}/etc/xdm-hallo/theme
  cp chocolate.rc navy.rc ${pkgdir}/etc/xdm-hallo/theme
  cp xdm-hallo.rc ${pkgdir}/etc/xdm-hallo
  chmod 0755 ${pkgdir}/etc/xdm-hallo/xdm-hallo.rc
  ln -s /etc/xdm-hallo/theme/chocolate.rc ${pkgdir}/etc/xdm-hallo/xdm-theme.rc
  mkdir -p ${pkgdir}/etc/X11/xdm/xdm-hallo
  cp Xsession Xsetup Xstartup Xreset xdm-config ${pkgdir}/etc/X11/xdm/xdm-hallo
  chmod 0755 ${pkgdir}/etc/X11/xdm/xdm-hallo/{Xsession,Xsetup,Xstartup,Xreset}
  install -Dm755 ${srcdir}/xdm-hallo-xdesktops ${pkgdir}/usr/lib/systemd/scripts/xdm-hallo-xdesktops
  install -Dm0644 ${srcdir}/xdm-hallo.service ${pkgdir}/usr/lib/systemd/system/xdm-hallo.service
}
