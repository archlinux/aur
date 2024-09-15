# Maintainer: iris snazzsinclair@gmail.com
pkgname=revhubinterface-git
_pkgname=RevHubInterface
pkgver=1.4
pkgrel=1
pkgdesc="Software for controling a REV Expansion Hub on a PC over USB"
arch=('any')
url="https://github.com/unofficial-rev-port/REVHubInterface"
license=('BSD3')
makedepends=(
			'git'
            'pyinstaller'
            'python>=3.7'
		    'python-pyserial'
            'tk'
            'python-sv-ttk'
)
source=("$_pkgname::git+https://github.com/unofficial-rev-port/REVHubInterface.git#tag=v1.4")
b2sums=('SKIP')
pkgver(){
    cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'    
}   
build(){
    cd $_pkgname
    pyinstaller REVHubInterface.spec
}
package(){
    cd $_pkgname
    cp org.unofficialrevport.REVHubInterface.Devel.png revhubinterface.png
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps"  revhubinterface.png
    install -Dm644 -t "${pkgdir}/usr/share/applications" revhubinterface.desktop
    cd dist
    cp REVHubInterface revhubinterface
    install -Dm755 -t "${pkgdir}/usr/bin" revhubinterface
}
