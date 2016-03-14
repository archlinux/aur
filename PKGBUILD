# Maintainer: Peter Reschenhofer < peterreschenhofer at gmail dot com >
# Contributor: Familia < carlosfamilia at gmail dot com >
pkgname=rstudio-server-bin
pkgver=0.99.892
pkgrel=1
pkgdesc="A integrated development environment (IDE) for R (binary version from RStudio official website)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r>=2.11.1' 'glibc>=2.7' 'libedit' 'psmisc')
conflicts=('rstudio-server' 'rstudio-server-git')
provides=("rstudio-server=${pkgver}")
#options=(!strip)

_deb_x86_md5=97bdc0be11fce3ce17a224701cb2f2f6
_deb_x64_md5=f1c7b0838352a9048d32d38256d8d916
_rstudioservice_md5=eea28f7865720f6c8d5de12f3f631880

case "${CARCH}" in
    'i686')
        _arch=i386
        md5sums=(${_deb_x86_md5} ${_rstudioservice_md5})
        ;;
    'x86_64')
        _arch=amd64
        md5sums=(${_deb_x64_md5} ${_rstudioservice_md5})
        ;;
esac    

source=("https://download2.rstudio.org/rstudio-server-${pkgver}-${_arch}.deb"
        "rstudio-server.service")

install="${pkgname}".install

package() {
    msg "Converting debian package..."

    cd "${srcdir}"
    tar zxpf data.tar.gz -C "${pkgdir}"
    chmod 755 $(find ${pkgdir}/usr -type d)

    install -m755 -d "${pkgdir}/usr/bin"
    install -m755 -d "${pkgdir}/etc/rstudio"
    install -m644 -D "rstudio-server.service" "${pkgdir}/etc/systemd/system/rstudio-server.service"
}
