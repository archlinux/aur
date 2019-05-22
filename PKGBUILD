# Maintainer: Prem Kumar <prmsrswt@gmail.com>
pkgname=brother-dcpl2520d-cups-bin
pkgver=3.1.0
pkgrel=2
pkgdesc="CUPS wrapper for Brother DCP-L2520D printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=in&lang=en&prod=dcpl2520d_as&os=128"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf101125/brgenml1cupswrapper-3.1.0-1.i386.deb")
md5sums=('9d31b628b552959419f2f6c05e16b84a')

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
        tar -xf data.tar.gz -C "${srcdir}"
	sed -i -e '47,53c my $basedir = "/opt/brother/Printers/BrGenML1";' \
		${srcdir}/opt/brother/Printers/BrGenML1/cupswrapper/brother_lpdwrapper_BrGenML1
}

package() {
	mkdir -p ${pkgdir}/usr/share/cups/model/Brother
	mkdir -p ${pkgdir}/usr/lib/cups/filter
	cp ${srcdir}/opt/brother/Printers/BrGenML1/cupswrapper/brother-BrGenML1-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
	cp ${srcdir}/opt/brother/Printers/BrGenML1/cupswrapper/brother_lpdwrapper_BrGenML1 ${pkgdir}/usr/lib/cups/filter
}
