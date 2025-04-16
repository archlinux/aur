# PKGBUILD template to install gaussSum
# Contributor: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
# Contributor: Xyne <xyne at archlinux dot us>
pkgname=gausssum
pkgver=3.0.2
pkgrel=3
pkgdesc="Extracts and displays information from comp chem output files"
depends=('gnuplot' 'python-numpy' 'python-matplotlib' 'python-cclib' 'tk')
arch=('any')
license=('GPL')
url="https://github.com/gausssum/gausssum/"
source=(https://github.com/gausssum/gausssum/archive/9e4903654075ed536a8b9077614556def6c34564.zip)
sha1sums=('43720330087821b17322667a3271a67cc5acc870')

package() {
    #Create required directories
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/doc
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps

    #Install program
    cd ${srcdir}/gausssum-9e4903654075ed536a8b9077614556def6c34564/src
    sed -e '16asys.path.append("/usr/share")' -i ./GaussSum.py
    sed -e "s:\"Docs\":\"doc\", \"gausssum\":" -i ./gausssum/gausssumgui.py
    install -D -m755 GaussSum.py ${pkgdir}/usr/bin/gausssum
    cp -r gausssum ${pkgdir}/usr/share/gausssum
    chmod -R 755 ${pkgdir}/usr/share/gausssum

    #Install docs
    cd ${srcdir}/gausssum-9e4903654075ed536a8b9077614556def6c34564
    cp -r docs ${pkgdir}/usr/share/doc/gausssum
    chmod -R 755 ${pkgdir}/usr/share/doc/gausssum
    
    #Install icon
    cd ${srcdir}/gausssum-9e4903654075ed536a8b9077614556def6c34564/logo
    install -D -m644 GaussSum.ico ${pkgdir}/usr/share/pixmaps/gausssum.ico

    #Create and install menu entry
    cd ${srcdir}/gausssum-9e4903654075ed536a8b9077614556def6c34564/src
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



