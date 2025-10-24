# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn
pkgver=r45799
pkgrel=1
pkgdesc="The Versatile Commodore Emulator 8-bits (PET/C64/C128/Plus4/Vic20) - Development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL-2.0-or-later')
depends=(libevdev glew gtk3 portaudio libpulse pciutils curl mpg123)
makedepends=(dos2unix libpcap libxaw xa texlive-basic texlive-bin texlive-plaingeneric xorg-bdftopcf xorg-mkfontdir svn glib2-devel)  
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-sdl2' 'vice-sdl2-svn')
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
PET_1024.svg
Plus4_1024.svg
SCPU_1024.svg
SID_1024.svg
VIC20_1024.svg
)
sha256sums=('SKIP'
            'd124e0033f7ffb45ea3582c01971f8b51c429cd18df36abd75e21847da728a6a'
            '2bf07e60c6bdf332f7d31c9ef1572953f96d5b540cd76c7d07be72769eb052c3'
            'dd58d7ab618a7d70ac336b8c44f38438305ba9b94a54635b393c7c281e91824d'
            '8c0a385123ddd7b968be4edda9a079c995d279c30b0ec90bbb5a0171f72ea7b9'
            'dea9da4cb71dc85d53755b07bb9df04d09c2889c0eb905ca2823952a649ec4e1'
            '0cf0ff49d5c23e923a29f70bbc2299b06f79204606761f9065c3d10231ed2e67'
            'edb663a57b2fa4aadb87a1ec9e87b5e204638159b2fb65acfa145df0922b6f88'
            '2b30f1a92dc456a838ab00d9860d7325bf61b1f402e542bda70f65a8e03b9d04'
            'dedaf7ae2c1d5713997dae7d4e778c36bdbc698f8d07cca4c8ed7bc556a8fb44'
            '4be98cd407cec01231cce3b9420c3b973a36c9442cd6b71b9569ad393f5a0801'
            '2f6b915b16d955ebf4af7458075ad55399e5fc134c5b228abc93542410764084'
            'cec437f3def18b45a4a3fceb6c8c6e8d8f3ff148f39bf33068f68e56c4a2412a'
            '09da7fee74f13667a4a1d869f1c1c4fe5fd0ace8b092c5ae846c3e4c3a09d584'
            '71f0acf2d762869a33b121141e1c3f63b53a474fcb2f3a6a64417ad4d7e7d90d'
            '5e0af7deadbdad829f8efc762236695530805d93d85e8f379b5c5f99de8a5412'
            'b6fecc7c862c5c7370f9eda716f029255d9bb29c6c507080b53589d3ab896db2'
            'db2a72d6185b7eddc476639a24b81ec9bd193b83ace44d26bfad8111239451a8'
            'ce2710836a0622295d033c6b21d8d1b896cc3138d774234336f07bfc292ee317'
            'c443e2f8617b6404cd5a26678a5c018c8b12a0c1024275aebfe2e2addab17368'
            'bee44a1fe16fb92550c5960b9c568982624a6c3d18bdb44f82efd34ea0a0c66c')
options=(!debug)

pkgver() {
	echo r$(svnversion "${SRCDEST}"/${pkgname}/)
}

build() {
	cd "${pkgname}/vice"
	./autogen.sh 
    	./configure --prefix=/usr --libdir=/usr/lib --enable-gtk3ui --enable-pdf-docs --enable-ethernet --with-libcurl --with-mpg123
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
