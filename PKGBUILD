# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
# Contributor: radu242 <rbutoi(at)gmail(dot)com>
# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=easymp3gain-gtk2-bin
pkgver=0.5.0
pkgrel=6
pkgdesc="GTK2 Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGain (binary package)"
arch=('i686' 'x86_64')
url="http://easymp3gain.sourceforge.net/"
license=('GPL')
depends=('gtk2')
optdepends=('mp3gain: for MP3 support'
            'vorbisgain: for OGG support'
            'aacgain: for AAC suport')
provides=('easymp3gain')
conflicts=('easymp3gain-gtk2' 'easymp3gain-qt4' 'easymp3gain-qt4-bin')
install=easymp3gain.install
[ "$CARCH" = "x86_64" ] && _arch='amd64' || _arch='i386'
[ "$CARCH" = "x86_64" ] && source=("http://sourceforge.net/projects/easymp3gain/files/easymp3gain%20x86_64/easymp3gain-${pkgver}/easymp3gain-gtk2_${pkgver}_${_arch}.tar.gz") || source=("http://sourceforge.net/projects/easymp3gain/files/easymp3gain%20i386/easymp3gain-${pkgver}/easymp3gain-gtk2_${pkgver}_${_arch}.tar.gz")
[ "$CARCH" = "x86_64" ] && md5sums=('0e1a42c4d376057849e385b8c2b9fa4f') || md5sums=('69b5a186022678955086134d06db74a6')

build() {
	mkdir -p ${pkgdir}/usr/{share/{applications,doc/easymp3gain-gtk2,easymp3gain/{help,lang},icons/hicolor/},bin}

	cd ${srcdir}/easymp3gain-gtk2_${pkgver}-1_${_arch}/

	cp -r {help,lang} ${pkgdir}/usr/share/easymp3gain
	for i in 16 22 24 32 48 64 128 192; do
		mkdir -p ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/
		cp icons/easymp3gain-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/easymp3gain.png
	done
	cp -r applications ${pkgdir}/usr/share
	cp {AUTHORS,CHANGELOG.txt,README.txt,RELEASE.txt} ${pkgdir}/usr/share/doc/easymp3gain-gtk2/
	cp easymp3gain ${pkgdir}/usr/share/easymp3gain/
	ln -s /usr/share/easymp3gain/easymp3gain ${pkgdir}/usr/bin 
}
