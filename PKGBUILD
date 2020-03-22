# Maintainer: SanskritFritz (gmail)

_pkgname=timekpr
pkgname=$_pkgname-next
pkgver=0.2.13
pkgrel=2
pkgdesc="Control the computer usage of users. You can limit daily usage based on a timed access duration and configure periods of day when they can log in."
arch=('any')
url='https://launchpad.net/timekpr-next'
license=('GPL')
depends=('python-gobject' 'gtk3>=3.4' 'polkit' 'python-dbus' 'python-gobject' 'libappindicator-gtk3' 'dbus>=1.10.1' 'python-psutil')
optdepends=('lxqt-policykit: to start the Control Panel like in LXQT'
            'mate-polkit: to start the Control Panel like in Mate'
            'polkit-kde-agent: to start the Control Panel like in Plasma'
            'polkit-gnome: to start the Control Panel like in Gnome (legacy)'
            'xfce-polkit: to start the Control Panel like in XFCE')
provides=('timekpr')
conflicts=('timekpr' 'timekpr-next-beta' 'timekpr-beta' 'timekpr-revived-bzr' 'timekpr-next-git')
source=("https://launchpad.net/timekpr-next/stable/$pkgver/+download/timekpr-next-$pkgver.tar.gz")
install='timekpr-next.install'
md5sums=('6863eb2094ef8a36eeb39dbcbd3c23be')

package() {
	cd "$pkgname"

	cat debian/install | while read a b; do
		case "$a" in
			*"#"*) ;;
			"") ;;
			*)
			f=`basename "$a"`
			if [ -d $a ]; then
				install -d "$pkgdir/$b/$f"
			else
				install -D "$a" "$pkgdir/$b/$f"
			fi
		esac
	done
	install -m755 debian/postrm "$pkgdir"/usr/bin/timekpr.postrm
	install -m755 debian/postinst "$pkgdir"/usr/bin/timekpr.postinst

}
