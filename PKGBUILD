# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Anizio de Oliveira Rodrigues <aniziooliveira@bol.com.br>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=libreoffice-extension-vero
pkgver=3.2.15
pkgrel=1
pkgdesc='A spell checker and grammar checker for LibreOffice and OpenOffice.org - Brazilian Portuguese'
arch=('any')
url='https://pt-br.libreoffice.org/projetos/vero/'
license=('LGPL3' 'MPL')
depends=('libreoffice')
source=("https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR${pkgver//./}AOC.oxt")
noextract=("VeroptBR${pkgver//./}AOC.oxt")
sha256sums=('7571a3d8aaa0d5699f8b572d2fc613189876fa4fa87dcbda9a99bd63500210ee')

package () {
    install -d -m755 "${pkgdir}/usr/lib/libreoffice/share/extensions/vero"
    bsdtar -xf "VeroptBR${pkgver//./}AOC.oxt" -C "${pkgdir}/usr/lib/libreoffice/share/extensions/vero"
    chown -R root:root "${pkgdir}/usr/lib/libreoffice/share/extensions/vero"/*
    
    local _dir
    while read -r -d '' _dir
    do
        chmod 755 "$_dir"
    done < <(find "${pkgdir}/usr/lib/libreoffice/share/extensions/vero" -mindepth 1 -maxdepth 1 -type d -print0)
}
