# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_pkgname=DiscImageCreator
pkgname=discimagecreator-bin
url="https://github.com/saramibreak/DiscImageCreator"
arch=('x86_64')
pkgdesc="DiscImageCreator, official release with supplemental binaries and text files for full functionality."
provides=('discimagecreator')
conflicts=('discimagecreator')
pkgver=20240101
pkgrel=1
license=('Apache')
source=("https://github.com/saramibreak/DiscImageCreator/files/13801546/DiscImageCreator_20240101.tar.gz")
sha256sums=('360ac48f612e11b5c11d91b321f41ea3cc84b47e9a471d9ca63874c01ef4aaa3')

package() {

	# install binaries
	mkdir -p ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/${_pkgname}/DiscImageCreator.out ${pkgdir}/usr/bin/DiscImageCreator.out
	install -Dm 755 ${srcdir}/${_pkgname}/DVDAuth.out ${pkgdir}/usr/bin/DVDAuth.out
	install -Dm 755 ${srcdir}/${_pkgname}/EccEdc.out ${pkgdir}/usr/bin/EccEdc.out
	install -Dm 755 ${srcdir}/${_pkgname}/unscrambler.out ${pkgdir}/usr/bin/unscrambler.out

	# create symlinks for to deal with stupid idiot filenames for convenience; no, you can't just rename these,
	# `DiscImageCreator` calls them during execution and the `_linux.out` suffix is hardcoded into the source.
	# no, i'm not going to patch this trash.
	ln -s DiscImageCreator.out ${pkgdir}/usr/bin/DiscImageCreator
	ln -s DVDAuth.out ${pkgdir}/usr/bin/DVDAuth
	ln -s EccEdc.out ${pkgdir}/usr/bin/EccEdc
	ln -s unscrambler.out ${pkgdir}/usr/bin/unscrambler

	# install supplemental data files
	mkdir -p ${pkgdir}/usr/lib/${_pkgname}
	install -Dm 644 ${srcdir}/${_pkgname}/C2ErrorProtect.txt ${pkgdir}/usr/local/share/${_pkgname}/C2ErrorProtect.txt
	install -Dm 644 ${srcdir}/${_pkgname}/default.dat ${pkgdir}/usr/local/share/${_pkgname}/default.dat
	install -Dm 644 ${srcdir}/${_pkgname}/driveOffset.txt ${pkgdir}/usr/local/share/${_pkgname}/driveOffset.txt
	install -Dm 644 ${srcdir}/${_pkgname}/ReadErrorProtect.txt ${pkgdir}/usr/local/share/${_pkgname}/ReadErrorProtect.txt

	# install documentation
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/ChangeLog.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/ChangeLog.txt
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/Firmware\&Tool.md ${pkgdir}/usr/local/share/doc/${_pkgname}/Firmware\&Tool.md
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/KnownIssue.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/KnownIssue.txt
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/Reference.md ${pkgdir}/usr/local/share/doc/${_pkgname}/Reference.md
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/TestedDrive.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/TestedDrive.txt
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/Todo.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/Todo.txt
	install -Dm 644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/local/share/doc/${_pkgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

}
