# Contributor: Nazarov Pavel <genocid@rambler.ru>
# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=redhat-artwork
pkgver=14
pkgrel=1
pkgdesc="Artwork for Red Hat default look-and-feel (themes, icons) from Fedora"
arch=("i686" "x86_64")
url="http://www.redhat.com"
license=("GPL")
depends=("gtk-bluecurve-engine")
makedepends=("rpmextract")
optdepends=("gdm: for gdm themes")
_rhlink=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/$pkgver/Everything/source/SRPMS/
source=($_rhlink/bluecurve-classic-metacity-theme-1.0.0-3.fc12.src.rpm \
	$_rhlink/bluecurve-gtk-themes-1.0.0-4.fc12.src.rpm \
	$_rhlink/bluecurve-icon-theme-8.0.2-5.fc12.src.rpm \
	$_rhlink/bluecurve-metacity-theme-1.0.0-3.fc12.src.rpm \
	$_rhlink/fedora-icon-theme-1.0.0-7.fc13.src.rpm \
	$_rhlink/fedorabubbles-gdm-theme-1.0.0-3.fc12.src.rpm \
	$_rhlink/fedoradna-gdm-theme-1.0.0-3.fc12.src.rpm \
	$_rhlink/fedorainfinity-gdm-theme-8.0.1-3.fc12.src.rpm)
md5sums=('8a6a3bd7cdf85ef9176494ceae690a82'
         'ee8d1df5635ab3331e0b23cfc17c7e44'
         '7dcbad98675edebf9dd1c36f1958838f'
         'b25e3918a44bcd7f10673424d62bfef2'
         '8ca15cc766866e196f7c58ef6e2fcd8f'
         '9e674c1afb6310d863b174c51a14bc17'
         '6516ce9d4c825f712637f40c33a3485b'
         'f4fa131aff70e1d66632f80823b8f29d')


package() {
    cd "$srcdir"
    mkdir ./archives
    cd ./archives

    # extracting rpm's
    for x in ../*.rpm; do
        rpmextract.sh $x
    done
    # extracting archives
    for x in ./*.tar.bz2; do
        tar -xvjf $x
    done
    rm -r ./*.tar.bz2
    rm -r ./*.spec

    # installing themes
    for x in ./*/; do
        cd $x
        ./configure --prefix=/usr
        cd ./theme
        make install DESTDIR="$pkgdir"
        cd ../../
    done

    # cleaning
    rm -rf ./*/
}
