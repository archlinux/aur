# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
# based on work by Nico Di Rocco <dirocco.nico@gmail.com>

pkgname=xprofile
pkgver=1.2.0
pkgrel=3
pkgdesc="A tool to manage and automatically apply xrandr configurations."
arch=('any')
url="https://github.com/nrocco/xprofile"
license=('GPL')
depends=('python'
		 'xorg-xrandr'
         'python-docutils')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/x/$pkgname/$pkgname-$pkgver.tar.gz")		
md5sums=('be4c3a06f7a54ddae8e307f661ddf2b6')
sha256sums=('bdf80dd6b17f626c304dfa5dcac6f1a4505753a45368a1490cb36cd8164a5242')
sha512sums=('566ec63bd6b7db21ed64285aed1e294e6079fdf68dc690a383efe1bad6fe965242d6d1488bb44cff7eb6e7f0a5dbbb93711536c43d73123042dc673f00da6ad0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
	
	rst2man ./docs/man/xprofile.1.rst > xprofile.1
	rst2man ./docs/man/xprofilerc.5.rst > xprofilerc.5
	gzip -9 xprofile.1 xprofilerc.5
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xprofile/LICENSE"
	install -Dm644 zsh/completions "$pkgdir/usr/share/zsh/site-functions/_xprofile"
	install -Dm644 xprofile.1.gz "$pkgdir/usr/share/man/man1/xprofile.1.gz"
	install -Dm644 xprofilerc.5.gz "$pkgdir/usr/share/man/man5/xprofilerc.5.gz"
	
	python setup.py install --root="$pkgdir" --optimize=1
}
