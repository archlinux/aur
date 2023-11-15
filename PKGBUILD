# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Justin Wong <jusw85 at hotmail dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-git
pkgver=3.0.0.r16.g4a91687
pkgrel=2
pkgdesc='A user-friendly, customizable image viewer specifically designed to handle comic books'
arch=('any')
url='https://sourceforge.net/projects/mcomix/'
license=('GPL')
depends=('gtk3' 'python-pillow>=6.0.0' 'xdg-utils' 'python>=3.7'
         'desktop-file-utils' 'hicolor-icon-theme'
         'python-gobject>=3.36.0' 'python-cairo>=1.16.0')
makedepends=('gettext' 'intltool' 'git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=(
            'libunrar: for rar compressed comics'
            'p7zip: for 7z compressed comics'
            'unrar: for rar compressed comics'
            'unzip: for zip compressed comics'
            'lhasa: for lha compressed comics'
            'mupdf: for PDF comics'
           )
provides=('mcomix')
conflicts=('mcomix')
source=(
        "${pkgname}::git+http://git.code.sf.net/p/mcomix/git"
       )
sha256sums=('SKIP')

pkgver() {
        cd "${pkgname}"
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	python -m build --wheel --no-isolation
}

package() {
        cd "${pkgname}"

        python -m installer --destdir="${pkgdir}" dist/*.whl

        cp -a share "${pkgdir}/usr"
}
