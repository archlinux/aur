# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jake <aur@ja-ke.tech>
# Maintainer: Matthew Goulart <matthew.goulart@gmail.com>
pkgname=flatcam
pkgver=8.5
pkgrel=1
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG). Most recent, stable version (non-beta) from master branch"
arch=('any')
url="http://flatcam.org"
license=('MIT')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-shapely' 'python-simplejson' 'python-rtree' 'python-scipy' 'python-svg.path' 'python-pyqt4')

commit='dae9cbb0471e693b95fd809ddd8bf11ff026ac67'
commit_short='dae9cbb0471e'

source=("https://bitbucket.org/jpcgt/flatcam/get/$commit.tar.gz"
        "$pkgname.desktop"
        "$pkgname")

md5sums=('f502972a52090e8a8b98511314bd9d05'
        '81a99468c82c717b694ab109805dea2b'
        'd161e661f9fdbf0269e1632f9b203f9e')

package() {
    install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd jpcgt-flatcam-"$commit_short"
	install -D -m644 "share/flatcam_icon256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
    mkdir -p "${pkgdir}/opt/$pkgname"
	cp -r * "${pkgdir}/opt/$pkgname"
}
