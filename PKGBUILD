# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AKolenda
_gitname=openxplorer
_appname=OpenXplorer
_appid=io.winspace.Development
pkgname=${_gitname}-bin
pkgdesc="Windows File Explorer-inspired file manager for Linux"

pkgver=2.0.15
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://openxplorer.app/"

license=('AGPL-3.0-only')

provides=('openxplorer' 'winspace')
conflicts=("${provides[@]}")

depends=('glibc' 'libgcc' 'graphene' 'gst-plugins-base-libs' 'gtk4' 'glib2' 'gdk-pixbuf2' 'libsoup3' 'pango' 'gstreamer' 'sqlite' 'hicolor-icon-theme')
optdepends=('polkit: deleting a whole folder as administrator under admin://'
            'gst-plugins-base: reading videos and audio files for the Details tab'
            'gst-plugins-good: reading MP4, MP3 and other common media for the Details tab'
            'gvfs: the Recycle Bin and the drive and phone list'
            'gvfs-smb: SMB shares'
            'gvfs-mtp: phones'
            'gnome-keyring: remembering SMB passwords'
            'xdg-utils: making OpenXplorer the default file manager'
            'file-roller: Open in archive manager'
            'xdg-desktop-portal-gtk: Share on GNOME (its Email portal)'
            'cifs-utils: the persistent SMB mount helper, openxplorer-mount-share')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-${arch[0]}.tzst::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
sha256sums=('b5f26735a8fc465c06486437b2db09f71d9d5bde234813837eb60b51a80e2adc'
            'fa330b7ec7715da6050bb6cd8cc5ec86c61d0671da711fcc79460cf69193d260')
sha256sums_x86_64=('eaedf061ced8780e0b7143371cface9211b3dca36dc0eec3c8da8de2d008f5b5')

noextract=("${source_x86_64[@]%%::*}")


package() {
	cd "${pkgdir}/"

	tar --exclude=".*" --exclude="usr/share/licenses" --exclude="usr/share/doc" -xf "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.tzst"

	install -Dm644 ${srcdir}/README-${pkgver}.md ${pkgdir}/usr/share/doc/${pkgname}/README.md

	install -Dm644 ${srcdir}/LICENSE-${pkgver} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
