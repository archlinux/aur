# Maintainer: Dan Bright <productions at zaziork dot com>
pkgname=python-iptceditor-gtk3-git
pkgrel=2 # package release (reset to 1 when new package version released (pkgver)
pkgver=0.4.2 # package version (increment when new application version released,  but overwritten on build with pkgver() method below)
pkgdesc="NOTE: THIS IS BETA. USE AT YOUR OWN RISK. This is a python3 GTK3 wrapper for the EXIV2 application, which is used to read and edit IPTC (and other forms) of image metadata. It can handle bulk operations on directories of image files."
arch=('any')
url="https://github.com/ZWS2014/python-iptceditor-gtk3"
license=('GPL3')
depends=('exiv2' 'python>=3.0.0' 'python-gobject' 'desktop-file-utils' 'python-setuptools' 'python-magic' 'git' 'python-lxml')
source=("python-iptceditor-gtk3::git+https://github.com/ZWS2014/python-iptceditor-gtk3")
#source=($pkgname-$pkgver.tar.gz)
sha256sums=('SKIP')
pkgver() {
cd "$srcdir/python-iptceditor-gtk3/IptcEditor"
#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
printf "%s.r%s" "$(cat IptcEditor/VERSION.rst)" "$(git rev-list --count HEAD)" # reading from included version file ensures version matches with the published PyPi package version
}
#prepare() {
#}
package() {
mv $srcdir/python-iptceditor-gtk3/IptcEditor $srcdir/python-iptceditor-gtk3/IptcEditor-$pkgver
cd "$srcdir/python-iptceditor-gtk3/IptcEditor-$pkgver"
python setup.py install --root="$pkgdir/" --optimize=1
install -Dm644 "$srcdir/python-iptceditor-gtk3/IptcEditor-$pkgver/IptcEditor/resources/python-iptceditor-gtk3.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
install -Dm644 "$srcdir/python-iptceditor-gtk3/IptcEditor-$pkgver/IptcEditor/resources/iptc_editor-256x256.png" "$pkgdir/usr/share/pixmaps/iptc_editor-256x256.png"
}
post_install() {
update-desktop-database -q
}
post_remove() {
update-desktop-database -q
}
