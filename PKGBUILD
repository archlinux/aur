# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=bracelet-generator
pkgver=1.4.1
pkgrel=1
pkgdesc="Friendship bracelet pattern designer"
arch=('any')
url="https://braceletgenerator.sourceforge.io/"
license=('GPL3')
makedepends=('python-setuptools' )
depends=('tk' 'python-pillow' 'gettext' 'desktop-file-utils' 'shared-mime-info')
optdepends=('ghostscript: export pattern to .png or .jpeg',
            'zenity: nicer file browser and color chooser')
source=("$pkgname-$pkgver-src.tar.xz::https://sourceforge.net/projects/braceletgenerator/files/BraceletGenerator-1.4/$pkgname-$pkgver-src.tar.xz/download")
sha512sums=('fb338e1326faf7b8bcf1e3456b00604d2cc8c7b29d1443d6720e7357fdb13e499de64f70dba2164b56ffa34d6f2454b2ad3466d8597d090dfd4202511a77e879')
changelog=changelog

build() {
	cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -D -m644 bracelet-generator.sharedmimeinfo  "${pkgdir}/usr/share/mime/packages/bracelet-generator.xml"
}
