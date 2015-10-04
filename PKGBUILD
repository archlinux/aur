# Maintainer: dysphoria <>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Ray Powell <ray_al@xphoniexx.net>

pkgname=mcomix-git
_gitname=mcomix
pkgver=r1396.9ed169d
pkgrel=1
pkgdesc="A user-friendly, customizable image viewer specifically designed to handle comic books"
arch=('any')
url="https://github.com/benoit-pierre/mcomix"
license=('GPL')
depends=('pygtk' 'python2-pillow' 'xdg-utils' 'python2' \
         'desktop-file-utils' 'hicolor-icon-theme' 'python2-setuptools')
makedepends=('gettext' 'intltool')
optdepends=('libunrar: for rar compressed comics' \
            'p7zip: for 7z compressed comics' \
            'unrar: for rar compressed comics' \
            'unzip: for zip compressed comics' \
            'mupdf: for PDF comics')
provides=("mcomix")
conflicts=("mcomix")
source=('git+https://github.com/benoit-pierre/mcomix.git')
sha256sums=('SKIP')
install=mcomix.install

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    mkdir -p ${pkgdir}/usr
    export PYTHONPATH=${pkgdir}/usr/lib/python2.7/site-packages/
    mkdir -p $PYTHONPATH
    python2 setup.py install --prefix=${pkgdir}/usr --optimize=1 \
    --single-version-externally-managed --root=/

    install -Dm755 mime/comicthumb ${pkgdir}/usr/bin/comicthumb
    install -Dm644 mime/comicthumb.1.gz ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
    install -Dm644 mime/comicthumb.thumbnailer ${pkgdir}/usr/share/thumbnailers/comicthumb.thumbnailer
}

