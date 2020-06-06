# Maintainer: Victoria Mitchell <victoria@quietmisdreavus.net>
pkgname=git-htmldocs
pkgver=2.27.0
pkgrel=1
pkgdesc="HTML documentation files for Git"
arch=('any')
url="https://git-scm.com/"
license=('GPL2')
groups=()
depends=('git')
makedepends=()
checkdepends=()
optdepends=()
source=("https://www.kernel.org/pub/software/scm/git/$pkgname-$pkgver.tar."{xz,sign})
sha256sums=('ffa91681b6a8f558745924b1dbb76d604c9e52b27c525c6bd470c0123f7f4af3'
            'SKIP')
# all of the files in the archive can be extracted directly into the documentation dir, so extract
# it manually
noextract=("$pkgname-$pkgver.tar.xz")
validpgpkeys=('96E07AF25771955980DAD10020D04E5A713660A7') # Junio C Hamano
options=(!strip) # there are no binaries in the archive to strip

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver.tar.xz" -C "$srcdir/$pkgname-$pkgver"

    # the files in the archive all have mode 600 (folders 700) so reset those before copying in
    find "$srcdir/$pkgname-$pkgver" -type d -exec chmod 755 \{\} \+
    find "$srcdir/$pkgname-$pkgver" -type f -exec chmod 644 \{\} \+
}

package() {
    mkdir -p "$pkgdir"/usr/share/doc
    cp -a -r "$srcdir/$pkgname-$pkgver" "$pkgdir"/usr/share/doc/git-doc
}
