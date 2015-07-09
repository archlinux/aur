# Contributor: Nazarov Pavel <genocid@rambler.ru>
# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=redhat-artwork
pkgver=20
pkgrel=1
pkgdesc="Artwork for Red Hat default look-and-feel (themes, icons) from Fedora"
arch=("i686" "x86_64")
url="http://www.redhat.com"
license=("GPL")
depends=("gtk-bluecurve-engine")
makedepends=("rpmextract")
_rhlink=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/$pkgver/Everything/source/SRPMS/
source=("${_rhlink}/b/bluecurve-classic-metacity-theme-1.0.0-8.fc20.src.rpm"
	"${_rhlink}/b/bluecurve-gtk-themes-1.0.0-10.fc20.src.rpm"
	"${_rhlink}/b/bluecurve-icon-theme-8.0.2-10.fc20.src.rpm"
	"${_rhlink}/b/bluecurve-metacity-theme-1.0.0-8.fc20.src.rpm"
	"${_rhlink}/f/fedora-icon-theme-1.0.0-15.fc20.src.rpm"
	"${_rhlink}/f/fedorainfinity-backgrounds-0.0.5-9.fc20.src.rpm"
	"${_rhlink}/f/fedorainfinity-screensaver-theme-1.0.0-8.fc20.src.rpm"
	"${_rhlink}/f/fedora-logos-21.0.1-1.fc20.src.rpm"
	"${_rhlink}/f/fedora-remix-logos-1.0.0-7.fc20.src.rpm")

package() {
    cd "${srcdir}"

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
        make install DESTDIR="${pkgdir}"
        cd ../../
    done

    # cleaning
    rm -rf ./*/
}

