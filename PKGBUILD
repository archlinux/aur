pkgname=ssacli
pkgver=4.21.7.0 
pkgrel=1
pkgdesc="The HPE Smart Storage Administrator CLI is a commandline-based disk configuration program that helps you configure, manage, diagnose, and monitor HPE ProLiant Smart Array Controllers"
arch=('x86_64')
url="https://support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_521fc533ba8f468f9ad9db20e4"
replaces=(hpacucli hpssacli)
groups=(hpproliant)
license=('custom:HPE End User License Agreement – Enterprise Version' 'custom:PROLIANT ESSENTIALS SOFTWARE')
depends=('sh')

sha256sums=("a911dfcf2855d36fe32f064c7c0a3454282aa9d1710548e6aaf3ece2bf167c52"
	    "eafd42b725d5fabea0070c67b2a0dd7bc0f4035a6dae57c3edcf665e60abd96e")

source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1857046646/v183344/ssacli-4.21-7.0.x86_64.rpm"
	"https://downloads.linux.hpe.com/SDR/downloads/mcp/EULA.txt")

package() {
	
	#installing certificates
	install -D -m644 "${srcdir}/opt/smartstorageadmin/ssacli/bin/ssacli.license" "${pkgdir}/usr/share/licenses/hpssacli/LICENSE_PES"
	install -D -m644 "EULA.txt"  "${pkgdir}/usr/share/licenses/hpssacli/LICENSE_HPE"

	#moving the actual files
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr/sbin" "${pkgdir}/usr/bin"
	cp -r "${srcdir}/usr/man" "${pkgdir}/usr/share/man"

	#changing permission to the binaries to strip
	chmod 755 "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssacli"
	chmod 755 "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssascripting"

	#stripping the binaries
	strip --strip-unneeded "${pkgdir}/opt/smartstorageadmin/ssacli/bin/rmstr" 
	strip --strip-unneeded "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssacli" 
	strip --strip-unneeded "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssascripting" 

	#changing permission to the binaries after stripping
	chmod 500 "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssacli"
	chmod 500 "${pkgdir}/opt/smartstorageadmin/ssacli/bin/ssascripting"
}
