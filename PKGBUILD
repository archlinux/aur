# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.6.1
pkgrel=2
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=('x86_64')
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib1 qt5-multimedia qt5-quickcontrols qt5-declarative qt5-base glibc gcc-libs zlib libglvnd libpng harfbuzz md4c krb5 openssl double-conversion icu pcre2 zstd glib2 freetype2 graphite e2fsprogs keyutils xz lz4 libcap libgcrypt pcre libx11 bzip2 libgpg-error libxcb libxau libxdmcp )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('214f5331e884b1835dad73f0ba5a527f88c886dc6bc4a85976f6ed84d72351f78a142360b54c54482d74ac631fbdd35fda3f958dc5d15da79be285019ad61a92')

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	chown -R 0:0 ${pkgdir}
	# Binary Placement
	mkdir -p "${pkgdir}/usr/bin/"
	mv ${pkgdir}/opt/lyrics-finder/LyricsFinder ${pkgdir}/usr/bin/lyricsfinder
	# License Info
	mkdir -p "${pkgdir}/usr/share/licenses/"$pkgname"/"
	mv ${pkgdir}/usr/share/doc/lyrics-finder/copyright ${pkgdir}/usr/share/licenses/"$pkgname"/
	# Correct Application Shortcut
    echo '[Desktop Entry]
Name=Lyrics Finder
GenericName=Lyrics
Comment=Search lyrics for your music
Exec=/usr/bin/lyricsfinder %U
Terminal=false
Type=Application
Icon=LyricsFinder
Categories=Network;
StartupNotify=false' > ${pkgdir}/usr/share/applications/lyrics-finder.desktop

}
