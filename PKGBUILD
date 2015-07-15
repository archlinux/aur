# PKGBUILD template to install gaussSum
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
# Contributor: Xyne <xyne at archlinux dot us>
pkgname=gausssum
pkgver=3.0
pkgrel=1
pkgdesc="A Program for getting results of Gaussian and GAMESS"
depends=('tcl' 'tk' 'gnuplot' 'python-numpy' 'python-matplotlib')
arch=('any')
license=('GPL')
url="http://gausssum.sourceforge.net"
source=(http://prdownloads.sourceforge.net/gausssum/GaussSum-${pkgver}.tar.gz)
sha1sums=('42af09793dc4a74557f8a3d3aed1a1a5bb66a7d3')
install=gausssum.install

package() {
    #Create required directories
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/doc
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps

    #Install program
    cd ${srcdir}/GaussSum-${pkgver}
    sed -e '16asys.path.append("/usr/share")' -i ./GaussSum.py
    sed -e "s:\"Docs\":\"doc\", \"gausssum\":" -i ./gausssum/gausssumgui.py
    install -D -m755 GaussSum.py ${pkgdir}/usr/bin/gausssum
    cp -r gausssum ${pkgdir}/usr/share/gausssum
    chmod -R 755 ${pkgdir}/usr/share/gausssum

    #Install docs
    cd ${srcdir}/GaussSum-${pkgver}
    cp -r Docs ${pkgdir}/usr/share/doc/gausssum
    chmod -R 755 ${pkgdir}/usr/share/doc/gausssum
    
    #Install icon
    cd ${srcdir}/GaussSum-${pkgver}
    install -D -m644 GaussSum.ico ${pkgdir}/usr/share/pixmaps/gausssum.ico

    #Create and install menu entry
    cd ${srcdir}/GaussSum-${pkgver}
    cat > GaussSum.desktop <<EOF
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=GaussSum
Comment=Program for Parsing Results of Gaussian and GAMESS
Exec=/usr/bin/gausssum
Icon=/usr/share/pixmaps/gausssum.ico
Categories=Application;Science;Education;
EOF
    install -m644 GaussSum.desktop ${pkgdir}/usr/share/applications/gausssum.desktop
}



