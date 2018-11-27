# Contributor: Swift Geek <swifgeek at google>
# Contributor: olasd
# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r
pkgver=1.3.0
pkgrel=14
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('i686' 'x86_64' 'armv7h')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo'
				 'perl-math-clipper' 'perl-math-convexhull'
				 'perl-math-geometry-voronoi' 'perl-math-planepath'
				 'perl-math-convexhull-monotonechain' 'perl-io-stringy'
				 'perl-encode-locale' 'perl-extutils-makemaker-aur>=6.82'
				 'perl-extutils-parsexs-aur' 'perl-extutils-typemap'
         'perl-sub-quote'
				 'perl-threads-aur>=1.96')
makedepends=('git' 'perl-module-build-withxspp')
optdepends=('perl-wx: GUI support'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-wx-glcanvas: support for opengl preview'
            'perl-opengl: support for opengl preview'
            'perl-class-xsaccessor: creating faster accessor methods')
#             'perl-growl-gntp: notifications support via growl'
provides=('slic3r')
conflicts=('slic3r-git')
#Consider uncommenting line below in case of false negative test results ;)
BUILDENV+=('!check')
source=("https://dl.slic3r.org/linux/slic3r-${pkgver}-linux-x64.tar.bz2"
				'slic3r.desktop'
				'slic3r')
sha256sums=('23761e32aca057de12e940fca097bcfef5a1efea9ff4998f8aa9fd58241db6dd'
         '332ef39aab3893622df7027b98d7deef424cb9563b458e13a129ef687a899cdd'
         '0286d609206aa929bcad30542a22dae17edb5286120f841770517170ee8b045a')
_src_dir='$srcdir/Slic3r-$pkgver'

package()
{
	cd $srcdir
	
	install -d "$pkgdir/opt"
	tar xfj slic3r-${pkgver}-linux-x64.tar.bz2 -C "$pkgdir/opt/"
	sed -i "$pkgdir/opt/Slic3r/Slic3r" -e 's/DIR=.*$/DIR=\/opt\/Slic3r/'
	sed -i "$pkgdir/opt/Slic3r/Slic3r" -e 's/LD_LIBRARY_PATH=.*$/LD_LIBRARY_PATH=\/opt\/Slic3r\/bin/'
	
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Slic3r/Slic3r" "$pkgdir/usr/bin/slic3r"
	
	install -d "$pkgdir/usr/share/applications"
	install -m 644 $srcdir/slic3r.desktop "$pkgdir/usr/share/applications/"
}