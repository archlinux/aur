# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=rmmagent
pkgver=1.0.2.1
pkgrel=4
pkgdesc='Remote Monitoring Agent for GFI Languard Dashboard'
arch=('i686' 'x86_64')
url='http://languard.gfi.com/'
license=('custom')
options=('!strip')
provides=('rmmagent')
depends_x86_64=(
	'libopenssl-1.0-compat'
	'ethtool'
	'smartmontools'
	'gcc-libs'
	'glibc'
	'openssl'
	'unzip')

depends_i686=(
	'ethtool'
	'smartmontools'
	'gcc-libs'
	'glibc'
	'openssl'
	'unzip')

install=.INSTALL
source_x86_64=("http://repos.systemmonitor.us/rmmagent/Debian_7.0/amd64/rmmagent_1.0.2-1_amd64.deb")
source_i686=("http://repos.systemmonitor.us/rmmagent/Debian_7.0/i386/rmmagent_1.0.2-1_i386.deb")
source=("rmmagentd.service")
md5sums_x86_64=('62dd6edc1755d79800b55733f4e212e2')
md5sums_i686=('a2608fa15a889bf5634e14853d2ecdd0')
md5sums=('28e9171b39f6eafcca88d70aea08195a')

prepare() {
	tar -xf data.tar.gz
	tar -xf control.tar.gz
	mv usr/local/lib/ usr/lib
	mv usr/local/rmmagent usr/rmmagent
	mkdir -p "$srcdir"/etc/systemd/system	
	cp rmmagentd.service "$srcdir"/etc/systemd/system/rmmagentd.service
}

package() {
	# Install
	cp -dr --no-preserve=ownership {etc,usr} "${pkgdir}"/
}
