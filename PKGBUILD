# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>
# Contributor: Vale Cofer-Shabica <vale.cofershabica@gmail.com>

pkgname=urw-classico
pkgver=20250803
pkgrel=3
pkgdesc="URW Classico font from CTAN (for texlive)"
arch=("any")
license=("AGPL-3.0-only")
url="https://www.ctan.org/tex-archive/fonts/urw/classico"
depends=("texlive-core")
source=("https://mirrors.ctan.org/install/fonts/urw/classico.tds.zip"
       "$pkgname.maps")
noextract=("classico.tds.zip")
sha256sums=('52264926a1f087fe3ed2318540f1ab87de7ac4d1db2faf2adb9a03647f1fea4b'
            '48b27e6629fc71b5661325b63b31c95aafc1db7fd2a5f3a5993597d2ece89ff7')
package() {

    _texmf_root=usr/share/texmf-dist

    install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
    install -m644 $srcdir/$pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs

    install -m755 -d $pkgdir/$_texmf_root
    bsdtar -x --no-same-permissions -f classico.tds.zip -C $pkgdir/$_texmf_root

    rm -rf $pkgdir/$_texmf_root/{doc,dvips}
}
