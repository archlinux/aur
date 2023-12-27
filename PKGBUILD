# Maintainer: Guillermo Duran < gds506 at gmail dot com >
# Maintainer: Mark Lee <mark@markelee.com>
# Previous Maintainer: Peter Reschenhofer < peterreschenhofer at gmail dot com >
# Contributor: Familia < carlosfamilia at gmail dot com >
pkgname=rstudio-server-bin
pkgver=2023.12.0_369
pkgrel=2
pkgdesc="A integrated development environment (IDE) for R (binary version from RStudio official website)"
arch=('x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r>=3.3.0' 'glibc>=2.7' 'libedit' 'psmisc' 'openssl-1.1')
conflicts=('rstudio-server' 'rstudio-server-git')
sha256sums=('bd670c4ef1241009a2cc0960ea0e99c8ba44fcc257331505546a1f3c0dee5686'
            '24b0545aa2a576c7d7480c0ef77d7641e2ebaadae856fd2a18f57871bd25fd88'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92')
provides=("rstudio-server=${pkgver}")
#options=(!strip)
source=("https://download2.rstudio.org/server/focal/amd64/rstudio-server-${pkgver/_/-}-amd64.deb"
        "rstudio-server.service"
        "rstudio")
install="${pkgname}".install

package() {
    msg "Converting debian package..."

    cd "${srcdir}"
    #tar zxpf data.tar.xz -C "${pkgdir}"
    tar xf data.tar.xz -C "${pkgdir}"
    chmod 755 $(find ${pkgdir}/usr -type d)

    install -m755 -d "${pkgdir}/usr/bin"
    install -m755 -d "${pkgdir}/etc/rstudio"
    install -m644 -D "rstudio-server.service" "${pkgdir}/etc/systemd/system/rstudio-server.service"
    mkdir -p "${pkgdir}/etc/pam.d"
    install -m644 -D "rstudio" "${pkgdir}/etc/pam.d/"
}
