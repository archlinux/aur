#Maintainer: Martin Lukes <martin.meridius@gmail.com>
_appname=smartgit
pkgname=${_appname}_preview
pkgver=7.2_preview_9
pkgrel=1
pkgdesc="Git client with Hg and SVN support. Preview version."
arch=("any")
url="https://www.syntevo.com/smartgit/preview"
license=('custom')
depends=("java-environment" "python" "hicolor-icon-theme")
makedepends=("desktop-file-utils" "sh")
optdepends=("mercurial: hg repositories support"
            "git: git repositories support")
replaces=("smartgithg")
conflicts=("smartgit")
provides=("smartgit")

# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//_/-}

source=(https://www.syntevo.com/static/smart/download/${_appname}/${_appname}-linux-${_pkgver}.tar.gz
        smartgit.desktop)
install="smartgit_preview.install"
sha1sums=('7be106736f79ac78af5a62c06c2b5e3e34aa3d3d'
          'bafa47c0b43ad89aaa3b34a078771b3cd12bd1f3')

package() {
    cd "$srcdir"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_appname}"/licenses/*
    mkdir -p "${pkgdir}"/opt
    mv "${_appname}" ${pkgdir}/opt/${pkgname} || return 1

    install -D -m644 smartgit.desktop "${pkgdir}"/usr/share/applications/${_appname}.desktop

    # link icon files
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,48x48,64x64,128x128,256x256}/apps
    cd ${pkgdir}/usr/share/icons/hicolor
    ln -s /opt/${pkgname}/bin/smartgit-32.png 32x32/apps/${_appname}.png
    ln -s /opt/${pkgname}/bin/smartgit-48.png 48x48/apps/${_appname}.png
    ln -s /opt/${pkgname}/bin/smartgit-64.png 64x64/apps/${_appname}.png
    ln -s /opt/${pkgname}/bin/smartgit-128.png 128x128/apps/${_appname}.png
    ln -s /opt/${pkgname}/bin/smartgit-256.png 256x256/apps/${_appname}.png

    # create link in /usr/bin
    cd ${pkgdir}
    chmod 755 opt/${pkgname}/bin/smartgit.sh
    mkdir -p usr/bin
    ln -s /opt/${pkgname}/bin/smartgit.sh usr/bin/${_appname}
}
