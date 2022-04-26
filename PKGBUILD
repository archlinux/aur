# Maintainer: dakataca <danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>
pkgname=pseint
pkgver=20210609
pkgrel=1
pkgdesc='Herramienta educativa para aprender los fundamentos y el desarrollo de la lógica de la programación'
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=('pseint-bin')
depends=('libpng12' 'glu')
makedepends=('gzip')
noextract=(creator.psz)
source=(https://razaoinfo.dl.sourceforge.net/project/pseint/${pkgver}/pseint-l64-${pkgver}.tgz)
sha256sums=('a5df4e147c529e3da509b30dee02791642c32cb3b5bbbc6cd3cd7594f10cb9f4')  # 'makepkg -g' para generarlo.

package () {

    mkdir -p ${pkgdir}/opt/
    cp -r ${srcdir}/${pkgname}/ ${pkgdir}/opt/

    mkdir -p ${pkgdir}/usr/share/applications/
    tee ${pkgdir}/usr/share/applications/pseint.desktop <<EOF 
    [Desktop Entry]
    Name=PSeInt en GNU/Linux
    GenericName=PSeInt
    Comment=Una herramienta para aprender las bases de la programación mediante pseudocodigo en español
    Type=Application
    Exec=pseint
    Icon=/opt/pseint/imgs/icon.icns
    Terminal=false
    Categories=Development
EOF
    mkdir -p ${pkgdir}/usr/bin/

    tee ${pkgdir}/usr/bin/pseint <<EOF 
    #!/usr/bin/env sh
    /opt/pseint/wxPSeInt
EOF
    chmod +x ${pkgdir}/usr/bin/pseint
}
