# Maintainer: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=xdm-xfreq
pkgver=0.18
pkgrel=1
pkgdesc="A customized XDM for XFreq"
arch=(any)
license=('GPL')
url="http://github.com/cyring/xdm-xfreq"
depends=('xfreq-git' 'xorg-xdm' 'xorg-xclock' 'xorg-xmessage' 'xorg-xsetroot' 'xorg-xdpyinfo' 'xdg-utils' 'xterm' 'scrot' 'dmenu' 'gawk')
optdepends=('psmisc' 'imagemagick' 'numlockx' 'synergy-git')
backup=(etc/xdm-xfreq/xdm-xfreq.rc)
install=xdm-xfreq.install
source=(xdm-config
	Xsetup
	Xstartup
	Xsession
	Xreset
	xdm-xfreq.rc
	xdm-xfreq-xdesktops
	xdm-xfreq.service
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
  mkdir -p ${pkgdir}/etc/xdm-xfreq/theme
  cp chocolate.rc navy.rc ${pkgdir}/etc/xdm-xfreq/theme
  cp xdm-xfreq.rc ${pkgdir}/etc/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/xdm-xfreq/xdm-xfreq.rc
  ln -s /etc/xdm-xfreq/theme/chocolate.rc ${pkgdir}/etc/xdm-xfreq/xdm-theme.rc
  mkdir -p ${pkgdir}/etc/X11/xdm/xdm-xfreq
  cp Xsession Xsetup Xstartup Xreset xdm-config ${pkgdir}/etc/X11/xdm/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/X11/xdm/xdm-xfreq/{Xsession,Xsetup,Xstartup,Xreset}
  install -Dm755 ${srcdir}/xdm-xfreq-xdesktops ${pkgdir}/usr/lib/systemd/scripts/xdm-xfreq-xdesktops
  install -Dm0644 ${srcdir}/xdm-xfreq.service ${pkgdir}/usr/lib/systemd/system/xdm-xfreq.service
}
