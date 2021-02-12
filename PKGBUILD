# Maintainer 5amu <v.casalino@protonmail.com>

pkgbase=searchpoc
pkgname=searchpoc
pkgver=v0.0.1
pkgrel=0
pkgdesc="Search a PoC for a (or some) given CVE id"
url="https://github.com/5amu/searchpoc/"
license=('MIT')
_source='https://raw.githubusercontent.com/5amu/searchpoc/v0.0.1/searchpoc.py'
arch=('any')
_md5sum='556b2288b8e95eff0c08413edcceb433'
depends=(
   python3
)

prepare() {
    cd $srcdir/

    source_filename=${_source##*/}
    if [ ! -f "$source_filename" ]; then
        echo "Downloading the python script ..."
        curl -A "$source_filename" -O "$_source"
    else
        echo "Already downloaded!"
    fi
    
    echo "Validating sources ..."
    source_expected_md5sum=${_md5sum}
    source_actual_md5sum=$(md5sum $source_filename | awk '{print $1}')
        
    if [ "$source_actual_md5sum" == "$source_expected_md5sum" ]; then
        echo "Validated - $source_filename"
    else
        echo "Corrupted source - $source_filename"; return 1
    fi
}

build() { echo;}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    install -m 0755 $srcdir/${_source##*/} $pkgdir/usr/bin/$pkgname
}

#vim: syntax=sh
