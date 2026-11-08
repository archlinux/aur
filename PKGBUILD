# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=anuzdhk
_gitname=tuck-filemanager
_appname=${_gitname%-filemanager}
pkgname=${_appname}-bin
pkgdesc="Fast, friendly file manager"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('tar')
depends=('glibc' 'libgcc' 'glib2' 'gtk4' 'vte4' 'libadwaita' 'gtksourceview5' 'poppler-glib' 'cairo' 'graphene' 'pango' 'libarchive' 'xz' 'hicolor-icon-theme')
optdepends=('gvfs: network locations, Trash on other drives'
            'gvfs-smb: Windows shares'
            'git: git status in folders'
            'flatpak: installing .flatpakref files'
            'unrar: password-protected RAR archives'
            'imagemagick: Image Converter addon'
            'ffmpeg: Video Compressor addon')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tzst::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst")
sha256sums_x86_64=('255b4a7627487411f35bde5ef66cbb7cb73d44acba63db78eb9c590bdb99ef12')

noextract=("${source_x86_64[@]%%::*}" "${source_i686[@]%%::*}" "${source_aarch64[@]%%::*}")


package() {
    cd "${pkgdir}/"

    tar --exclude=".*" -xf "${srcdir}/${_appname}-${CARCH}-${pkgver}.tzst"

    mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"
    mv "${pkgdir}/usr/share/licenses/${_appname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
