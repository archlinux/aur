# Maintainer: Nadir Boussoukaia <boussou@gmail.com>

pkgname=ivpn-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC service for ivpn VPN service"
arch=('any')
url='https://aur.archlinux.org/packages/ivpn-vpn-openrc'
license=('GPL')
depends=('openrc' 'ivpn')

build()
{
	#cd "$srcdir/$pkgname"
    cat > ivpn << EOF
#!/usr/bin/openrc-run

supervisor="supervise-daemon"
description="The IVPN daemon"
command="/usr/bin/ivpn-service"
command_args=""

depend() {
	need localmount
	use dns
	provide vpn 
}

EOF

}


package() {
  install -Dm755 ${srcdir}/ivpn "$pkgdir"/etc/init.d/ivpn  
}
