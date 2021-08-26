# Maintainer: Cuan <idgr at tutanota dot com>

pkgname=lyricsfinder
pkgver=1.5.4
pkgrel=1
pkgdesc="A cross-platform lyrics fetcher by Mediahuman"
arch=( 'x86_64' )
options=('!emptydirs')
url="https://www.mediahuman.com/lyrics-finder"
license=('custom')
depends=( taglib qt5-declarative qt5-base glibc gcc-libs zlib libglvnd libpng harfbuzz md4c krb5 openssl systemd-libs double-conversion icu pcre2 zstd glib2 freetype2 graphite e2fsprogs keyutils xz lz4 libcap libgcrypt pcre libx11 bzip2 libgpg-error libxcb libxau libxdmcp )

source=('https://www.mediahuman.com/download/LyricsFinder.amd64.deb')
sha512sums=('cda045a46cad6512c746e2c983d0c59027906db20629604113154f9505feb6d12ce9cb88e04865d0281f306fa8400048d7eacf97af92c4e2f186b8857dfd5a2f')

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
