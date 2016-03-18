# Maintainer: fenuks

_pkgname=rpgmakertrans
pkgname=$_pkgname-hg
pkgver=2016.03.19.r808.b698918e3f5c
pkgrel=1
pkgdesc="Translation Tool for RPGMaker Games"
arch=("i686" "x86_64")
url="http://rpgmakertrans.bitbucket.org/index.html"
license=("GPL3")
depends=("python" "python-pyside" "python-autopep8" "python-coverage"
        "python-fuzzywuzzy" "pep8" "python-pyenchant" "python-pylint"
        "python-levenshtein"
)
makedepends=("mercurial")
provides=("$_pkgname")
install=$pkgname.install
source=("hg+https://bitbucket.org/rpgmakertrans/rpgmakertrans#branch=default"
        "rpgmakertrans-gui" "rpgmakertrans-cli"
)

sha256sums=('SKIP'
            '2c20d732c49a10f4ac744db4f5d489734d387208f154fd2236a308589101f4c6'
            'e3acd0ec417cb079f146bedb3eb07d314da7be90ad2202678228a8e8a1ca8c00')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.r%s.%s" "$(date -I | tr '-' '.')" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    cd "$srcdir/$_pkgname"
    # setuptools does not work under Linux and it uses cx_Freeze
    # python setup_rpgmakertrans.py install --root="$pkgdir/" --optimize=1
    install -Dm 755 rpgmakertrans.py $pkgdir/opt/rpgmakertrans/rpgmakertrans.py
    install -Dm 755 rpgmt.py $pkgdir/opt/rpgmakertrans/rpgmt.py
    cp -R cli gui librpgmakertrans $pkgdir/opt/rpgmakertrans/
    install -dm 755 $pkgdir/usr/bin
    install -Dm 755 $srcdir/rpgmakertrans-cli $pkgdir/usr/bin/rpgmakertrans-cli
    install -Dm 755 $srcdir/rpgmakertrans-gui $pkgdir/usr/bin/rpgmakertrans-gui
}
