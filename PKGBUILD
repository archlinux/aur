# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=rmmagent
pkgver=1.0.4.1
pkgrel=1
pkgdesc='Remote Monitoring Agent for GFI Languard Dashboard'
arch=('x86_64')
url='http://languard.gfi.com/'
license=('custom')
options=('!strip')
provides=('rmmagent')
depends_x86_64=(
	'openssl-1.0'
	'ethtool'
	'smartmontools'
	'gcc-libs'
	'glibc'
	'openssl'
	'unzip')

install=.INSTALL
source_x86_64=("http://repos.systemmonitor.us/rmmagent/Debian_8.0/amd64/rmmagent_1.0.4-1_amd64.deb")
source=("rmmagentd.service")
md5sums_x86_64=('36821c2fd73f86fd9e5870029605289a')
md5sums=('28e9171b39f6eafcca88d70aea08195a')

prepare() {
	tar -xf $srcdir/data.tar.xz
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
