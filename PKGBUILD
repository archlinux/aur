# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=mythes-cs
pkgver=20150310
pkgrel=1
pkgdesc="Czech thesaurus"
arch=("any")
url="https://wiki.archlinux.org/index.php/LibreOffice#Language_Aids"
license=("custom")
optdepends=("libmythes: offers thesaurus library functions")
source=("http://pkgs.fedoraproject.org/repo/pkgs/mythes-cs/thes_cs_CZ_v2.zip/7f9c85b104db4cc6a719b3aab8c69a10/thes_cs_CZ_v2.zip")
md5sums=("7f9c85b104db4cc6a719b3aab8c69a10")

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/share/mythes"
    install -m644 th_cs_CZ_v2.* "$pkgdir/usr/share/mythes"

    # the symlinks
    install -dm755 "$pkgdir/usr/share/myspell/dicts"
    pushd "$pkgdir/usr/share/myspell/dicts"
        for file in "$pkgdir/usr/share/mythes/"*; do
            ln -sv /usr/share/mythes/$(basename $file) .
        done
    popd

    # docs
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 th_cs_CZ_license.txt "$pkgdir/usr/share/doc/$pkgname"
}
