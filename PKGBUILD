# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# patch idea taken from package brother-hl-l2380dw by apaugh

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=brother-dcp-l2500d
pkgver=3.2.0_1
pkgrel=3
pkgdesc='LPR and CUPS driver for the Brother DCP-L2500D'
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux'
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support.')
source=("http://download.brother.com/welcome/dlf101753/dcpl2500dlpr-${pkgver/_/-}.i386.rpm"
	"http://download.brother.com/welcome/dlf101754/dcpl2500dcupswrapper-${pkgver/_/-}.i386.rpm"
	'basedir.patch'
	'eula.txt')
sha256sums=('ec739bb742cb16f943e5faeed845b317ff6608229b4826c8738e5076f90e810e'
            'd53d13a0854f8a8fd50bdbaf3fe2edead7c52d17f11bb86c64d000d5ffd28aef'
            'a3ad56a074f83cad899b2d61deb10e47bfd7ba7e430a777dd043193be4733ff7'
            'd1c2d3abdcbcb3f5251fb8109d4b9eff0fba9707ae6697601d75bead71d7ffd4')

prepare() {
	patch -p1 -i ${srcdir}/basedir.patch
}

package() {
	cp -R ${srcdir}/opt ${pkgdir}/
	rm ${pkgdir}/opt/brother/Printers/DCPL2500D/cupswrapper/Copying
	install -Dm644 ${srcdir}/eula.txt ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
	ln -s /usr/share/licenses/GPL2/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-license.txt
	install -dm755 ${pkgdir}/usr/share/cups/model
	ln -s /opt/brother/Printers/DCPL2500D/cupswrapper/brother-DCPL2500D-cups-en.ppd ${pkgdir}/usr/share/cups/model/brother-DCPL2500D-cups-en.ppd
	install -dm755 ${pkgdir}/usr/lib/cups/filter
	ln -s /opt/brother/Printers/DCPL2500D/cupswrapper/brother_lpdwrapper_DCPL2500D ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2500D
}
