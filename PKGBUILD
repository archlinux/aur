# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn
pkgver=r39896
pkgrel=1
pkgdesc="The Versatile Commodore Emulator 8-bits (PET/C64/C128/Plus4/Vic20) - Development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=(giflib glew libjpeg-turbo libpulse gtk3 portaudio pciutils)
makedepends=(dos2unix ffmpeg libpcap libxaw texlive-bin texlive-core xa xorg-bdftopcf xorg-mkfontdir python)
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-sdl2' 'vice-svn-gtk3' 'vice-svn-sdl2')
source=("${pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk"
vice-org-vsid.desktop
vice-org-x64dtv.desktop
vice-org-x64sc.desktop
vice-org-x128.desktop
vice-org-xcbm2.desktop
vice-org-xcbm5x0.desktop
vice-org-xpet.desktop
vice-org-xplus4.desktop
vice-org-xscpu64.desktop
vice-org-xvic.desktop
C64_1024.svg
C128_1024.svg
CBM2_1024.svg
CBM_Logo.svg
DTV_1024.svg
PET_256.svg
Plus4_1024.svg
SCPU_1024.svg
SID_1024.svg
VIC20_1024.svg
)
sha256sums=('SKIP'
            '2d76e0465a443307bd89134e4a7702e432a462e925a4b6c3e7de92c92189e6ab'
            'e1288731808cece9ed79aae41857373652acd987d6679301a02665cca33d2677'
            '34184a668683af49f0a0fb7fb56965fc83a8bb016659a05c9ce5ac549aee428b'
            '8665117a81c173d7896265674001eec1b7b04929da44b005cd2a475780dfbc4a'
            'afb7011530227d18ccd5c054c2de964d855b6a9e00f894620886f03262e8bf65'
            '51cfd13de63eebe684b5dd940fa427c8c1f9fb4800cdc78626022900490c9acc'
            '8b3aa9fde27db058305695664683564d036d9ac140a7ccb332da83a444180f12'
            '2cab0a317f75519223c8474e6cd950c955d0719f4eb15de5550533093ca3450c'
            'fac273dc05ba39154ae8951778c47cb332e68406d9c75008bbe9e1912e6262b9'
            '49538abc6016b83431f72f6303953518d3cbe1ac2ab0913ca98af2067ba4b96d'
            '2f6b915b16d955ebf4af7458075ad55399e5fc134c5b228abc93542410764084'
            'cec437f3def18b45a4a3fceb6c8c6e8d8f3ff148f39bf33068f68e56c4a2412a'
            '09da7fee74f13667a4a1d869f1c1c4fe5fd0ace8b092c5ae846c3e4c3a09d584'
            '71f0acf2d762869a33b121141e1c3f63b53a474fcb2f3a6a64417ad4d7e7d90d'
            '5e0af7deadbdad829f8efc762236695530805d93d85e8f379b5c5f99de8a5412'
            '195c1eb1989b16d7f78a0866980ca0919655808f483d3f79c0dfed1ccacefdc5'
            'db2a72d6185b7eddc476639a24b81ec9bd193b83ace44d26bfad8111239451a8'
            'ce2710836a0622295d033c6b21d8d1b896cc3138d774234336f07bfc292ee317'
            'c443e2f8617b6404cd5a26678a5c018c8b12a0c1024275aebfe2e2addab17368'
            'bee44a1fe16fb92550c5960b9c568982624a6c3d18bdb44f82efd34ea0a0c66c')

pkgver() {
	echo r$(svnversion "${SRCDEST}"/${pkgname}/)
}

build() {
	cd "${pkgname}/vice"
    	./autogen.sh 
    	./configure --prefix=/usr --libdir=/usr/lib --enable-external-ffmpeg
	make
}

package() {
	cd "${pkgname}/vice"
	make install DESTDIR="${pkgdir}/"
	# Working around --enable-desktop-files bug
	# See https://sourceforge.net/p/vice-emu/bugs/1379/
	mkdir $pkgdir/usr/share/applications/
	cp $srcdir/*.desktop $pkgdir/usr/share/applications/
	cp $srcdir/*.svg $pkgdir/usr/share/vice/common/
}
