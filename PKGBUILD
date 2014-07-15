# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Eric Mertens <emertens@gmail.com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

gitname="biosdisk"
pkgname="${gitname}-git"
pkgver=v0.75.18.g42a22fe
pkgrel=1
arch=('any')
pkgdesc="Utility for creating Dell BIOS flash disks"
url="http://linux.dell.com/cgi-bin/cgit.cgi/biosdisk.git"
license=("GPL")
makedepends=('git')
depends=('dos2unix' 'wget' 'syslinux' 'python2')
conflicts=("${gitname}")
provides=("${gitname}")
backup=("etc/biosdisk.conf")
options=('!strip')
source=("git+http://linux.dell.com/cgi-bin/cgit.cgi/${gitname}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 git describe --tags | sed 's|-|\.|g'
}

package() {
	 cd "${srcdir}/${gitname}"

	 install -Dm 755 {,"${pkgdir}"/usr/bin/}biosdisk
	 install -Dm 755 {,"${pkgdir}"/usr/bin/}blconf
	 install -Dm 644 {,"${pkgdir}"/etc/}biosdisk.conf
	 install -Dm 644 {,"${pkgdir}"/usr/man/man8/}biosdisk.8.gz
	 install -Dm 644 {,"${pkgdir}"/usr/share/biosdisk/}dosdisk.img
	 install -Dm 644 {,"${pkgdir}"/usr/share/biosdisk/}dosdisk288.img
	 install -Dm 644 {,"${pkgdir}"/usr/share/biosdisk/}dosdisk8192.img
	 install -Dm 644 {,"${pkgdir}"/usr/share/biosdisk/}biosdisk-mkrpm-redhat-template.spec
	 install -Dm 644 {,"${pkgdir}"/usr/share/biosdisk/}biosdisk-mkrpm-generic-template.spec

	 sed -i 's|python|python2|' "${pkgdir}"/usr/bin/blconf
}
